// WebTrends SmartSource Data Collector Tag v10.4.16
// Copyright (c) 2014 Webtrends Inc. All rights reserved.
// Created: 140409 - support at arena dot no
// Anonymize function
window.webtrendsAsyncLoad=function(_tag){
	_tag.DCS.dcsipa=1;
}
window.webtrendsAsyncInit=function(){
	var dcs=new Webtrends.dcs().init({
		adimpressions:true,
		adsparam:"WT.ac",
		anchor:true,
		dcsid:"dcskb2ftk3dv0h0cmlgjuexsc_3z8k",
		domain:"statse.webtrendslive.com",
		download:true,
		downloadtypes:"csv,doc,docx,epub,eps,gif,gzip,jpg,pdf,png,pps,ppsx,ppt,pptx,rar,rtf,sdv,txt,xls,xlsx,zip",
		enabled:true,
		fpcdom:".regjeringen.no",
		i18n:false,
		javascript:true,
		offsite:true,
		onsitedoms:"",
		paidsearchparams:"gclid",
		rightclick:true,
		timezone:1,
		trimoffsiteparams:false,
		plugins:{
			replicate:{
				src:"//s.arena.no/webtrends.replicate.js", 
				servers:[{domain:"sdc.arena.no",dcsid:"dcstlz6rp10000c505cd5dmli_7m7r"}],
				callbackTimeout: 200
			}
		}
	}).track();
};
(function(){
	var s=document.createElement("script"); s.async=true; s.src="//s.arena.no/webtrends.js";
	var s2=document.getElementsByTagName("script")[0]; s2.parentNode.insertBefore(s,s2);
}());