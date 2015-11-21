// Copyright (c) 2014 Webtrends Inc. All rights reserved.
// Multiply Hit Plugin v10.2.86    
// Created: 140409 - support at arena dot no
(function () {

    WebtrendsReplicate = function (tag, plugin) {
		
		this.servers = [];
		this.dcs = tag;
		this.requestGroupTimeout = (plugin.callbackTimeout) ? (plugin.callbackTimeout) : Webtrends.dcsdelay;
		
		//Nothing to do
		if (!plugin.servers) {
			return;
		}
		
		//Copy servers from plugin configuration and set dcsid if doesn't exist
		for (var n=0; n < plugin.servers.length; n++) {
			if (plugin.servers[n].domain) {
				var dcsid = plugin.servers[n].dcsid ? plugin.servers[n].dcsid : tag.dcsid;
				this.servers.push({server:plugin.servers[n].domain, dcsid:dcsid});
			}
		}
	}
	
	WebtrendsReplicate.prototype = {
		addHitReplicator: function() {
			var self = this;
			Webtrends.addTransform(
				function(dcs, options) { 
				
					var rep = new requestReplicator(self.servers, self.requestGroupTimeout);
					options.callback = rep.getCallback(dcs, options, options.callback);
					
					var origFinish = options.finish;
					options.finish = function(dcs, options) {
						rep.finish(dcs, options);
						if (typeof(origFinish) == "function")
							origFinish(dcs, options);
					}
				},
				"all",
				this.dcs
			);
		}
	}
		
	requestReplicator = function(servers, timeout) {
		
		this.servers = servers;
		this.requestCount = 0;
		this.origCallback;
		this.callbackTimedOut = false;
		this.timeout = timeout;
		
		var self = this;
		
		this.finish = function(dcs, options) {
		
			//replicate the requests
			this.requestCount++;				//One for the base tag request
			var src = dcs.images[dcs.images.length - 1].src;
			var query = src.substr(src.indexOf("?") + 1);
			if (query) {
				//iterate over the servers we should replicate and send
				for (var n = 0; n < self.servers.length; n++) {
					this.requestCount++;
					replicatedServer = self.servers[n];
					var repSrc = "http" + (location.protocol.indexOf('https:') == 0 ? 's' : '') + "://"; 
					repSrc += replicatedServer.server + "/" + replicatedServer.dcsid + "/dcs.gif?" + query;
					
					if (document.images) {
						var img = new Image();
						img.onload = function() {
							self.requestCount--;
							self.checkDone(dcs, options);
						}
						img.src = repSrc;
					}
				}
			}
			
			//call the original finish
			if (typeof(origFinish) == "function")
				origFinish();
			
			//Set a timeout to prevent a broken/invalid collection server from holding up the callback
			self.requestTimeout = window.setTimeout( 
				function() { 
					self.callbackTimedOut=true;
					if (typeof(self.origCallback) == "function")
						self.origCallback(dcs, options); 
				}, 
				self.timeout
			)
		}
		
		this.getCallback = function(dcs, options, origCallback) {
			this.origCallback = origCallback;
			return function(dcs, options) {
				self.requestCount--;
				self.checkDone(dcs, options);
			}
		}
		
		this.checkDone = function(dcs, options) {
			if (this.requestCount == 0 && typeof(this.origCallback) == "function" && !this.callbackTimedOut) {
				window.clearTimeout(this.requestTimeout);
				if (typeof(this.origCallback) == "function")
					this.origCallback(dcs, options);
			}
		}
	
	}
	
})();

var replicate_loader = function (tag, plugin) {

    var replicate = new WebtrendsReplicate(tag, plugin);
	replicate.addHitReplicator();

}

Webtrends.registerPlugin('replicate', replicate_loader);