(function(){var t,e,r,i,n,a;e=require("fs"),n=require("path"),r=require("js2xmlparser"),a=require(n.join(__dirname,"..","package.json")),i=require("./manifests"),require("coffee-script/register"),t=function(){function t(){}var a;return a=2,t.prototype.buildAllManifests=function(){var t,e,r,n;for(n=[],e=0,r=i.length;r>e;e++)t=i[e],n.push(this.buildManifest(t.name,t.fields,t.translate,t.output));return n},t.prototype.buildManifest=function(t,r,i,a,s){var o;return o=n.join("dist","manifests",t+".manifest."+a),this.output=a,e.writeFile(o,this.generateData(r,i,a),function(t){if(t)throw t;return s?s():void 0})},t.prototype.generateData=function(t,e,i){return"json"===i?JSON.stringify(t,null,2):"xml"===i?r("Package",t):void 0},t.prototype.transformData=function(t){var e,r,i;if(this.translate){i=this.translate;for(e in i)r=i[e],fields[e],t=t.replace(e,r)}return t},t}(),module.exports=t}).call(this);