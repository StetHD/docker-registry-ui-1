/*!
 * docker-registry-ui
 * Copyright (C) 2016  Jones Magloire @Joxit
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
function Http(){this.oReq=new XMLHttpRequest,this._events={},this._headers={}}Http.prototype.addEventListener=function(e,t){this._events[e]=t;var r=this;switch(e){case"loadend":r.oReq.addEventListener("loadend",function(){if(401==this.status){var e=new XMLHttpRequest;for(key in this.http._events)e.addEventListener(key,this.http._events[key]);for(key in this.http._headers)e.setRequestHeader(key,this.http._headers[key]);e.withCredentials=!0,e.open(this.http._method,this.http._url),e.send()}else t.bind(this)()});break;default:r.oReq.addEventListener(e,function(){t.bind(this)()})}},Http.prototype.setRequestHeader=function(e,t){this.oReq.setRequestHeader(e,t),this._headers[e]=t},Http.prototype.open=function(e,t){this._method=e,this._url=t,this.oReq.open(e,t)},Http.prototype.send=function(){this.oReq.http=this,this.oReq.send()};var registryUI={};registryUI.url=function(){return registryUI.getRegistryServer(0)},registryUI.getRegistryServer=function(e){try{var t=JSON.parse(localStorage.getItem("registryServer"));if(t instanceof Array)return isNaN(e)?t.map(function(e){return e.trim().replace(/\/*$/,"")}):t[e]}catch(r){}return isNaN(e)?[]:""},registryUI.addServer=function(e){var t=registryUI.getRegistryServer();e=e.trim().replace(/\/*$/,"");var r=t.indexOf(e);-1==r&&(t.push(e),localStorage.setItem("registryServer",JSON.stringify(t)))},registryUI.changeServer=function(e){var t=registryUI.getRegistryServer();e=e.trim().replace(/\/*$/,"");var r=t.indexOf(e);-1!=r&&(t.splice(r,1),t=[e].concat(t),localStorage.setItem("registryServer",JSON.stringify(t)))},registryUI.removeServer=function(e){var t=registryUI.getRegistryServer();e=e.trim().replace(/\/*$/,"");var r=t.indexOf(e);-1!=r&&(t.splice(r,1),localStorage.setItem("registryServer",JSON.stringify(t)))},registryUI.isImageRemoveActivated=!0,registryUI.catalog={},registryUI.taglist={},riot.mount("add"),riot.mount("change"),riot.mount("remove"),riot.mount("menu"),riot.mount("app");