(self.webpackChunkjupyter_matlab_labextension=self.webpackChunkjupyter_matlab_labextension||[]).push([[421],{421:(t,e,s)=>{"use strict";s.d(e,{Lu:()=>d,U1:()=>A});var i=s(708),r=s(606);class h{constructor(t,e,s,i,r,h,n,o,a,l=0,c){this.p=t,this.stack=e,this.state=s,this.reducePos=i,this.pos=r,this.score=h,this.buffer=n,this.bufferBase=o,this.curContext=a,this.lookAhead=l,this.parent=c}toString(){return`[${this.stack.filter(((t,e)=>e%3==0)).concat(this.state)}]@${this.pos}${this.score?"!"+this.score:""}`}static start(t,e,s=0){let i=t.parser.context;return new h(t,[],e,s,s,0,[],0,i?new n(i,i.start):null,0,null)}get context(){return this.curContext?this.curContext.context:null}pushState(t,e){this.stack.push(this.state,e,this.bufferBase+this.buffer.length),this.state=t}reduce(t){var e;let s=t>>19,i=65535&t,{parser:r}=this.p,h=this.reducePos<this.pos-25;h&&this.setLookAhead(this.pos);let n=r.dynamicPrecedence(i);if(n&&(this.score+=n),0==s)return this.pushState(r.getGoto(this.state,i,!0),this.reducePos),i<r.minRepeatTerm&&this.storeNode(i,this.reducePos,this.reducePos,h?8:4,!0),void this.reduceContext(i,this.reducePos);let o=this.stack.length-3*(s-1)-(262144&t?6:0),a=o?this.stack[o-2]:this.p.ranges[0].from,l=this.reducePos-a;l>=2e3&&!(null===(e=this.p.parser.nodeSet.types[i])||void 0===e?void 0:e.isAnonymous)&&(a==this.p.lastBigReductionStart?(this.p.bigReductionCount++,this.p.lastBigReductionSize=l):this.p.lastBigReductionSize<l&&(this.p.bigReductionCount=1,this.p.lastBigReductionStart=a,this.p.lastBigReductionSize=l));let c=o?this.stack[o-1]:0,u=this.bufferBase+this.buffer.length-c;if(i<r.minRepeatTerm||131072&t){let t=r.stateFlag(this.state,1)?this.pos:this.reducePos;this.storeNode(i,a,t,u+4,!0)}if(262144&t)this.state=this.stack[o];else{let t=this.stack[o-3];this.state=r.getGoto(t,i,!0)}for(;this.stack.length>o;)this.stack.pop();this.reduceContext(i,a)}storeNode(t,e,s,i=4,r=!1){if(0==t&&(!this.stack.length||this.stack[this.stack.length-1]<this.buffer.length+this.bufferBase)){let t=this,i=this.buffer.length;if(0==i&&t.parent&&(i=t.bufferBase-t.parent.bufferBase,t=t.parent),i>0&&0==t.buffer[i-4]&&t.buffer[i-1]>-1){if(e==s)return;if(t.buffer[i-2]>=e)return void(t.buffer[i-2]=s)}}if(r&&this.pos!=s){let r=this.buffer.length;if(r>0&&0!=this.buffer[r-4]){let t=!1;for(let e=r;e>0&&this.buffer[e-2]>s;e-=4)if(this.buffer[e-1]>=0){t=!0;break}if(t)for(;r>0&&this.buffer[r-2]>s;)this.buffer[r]=this.buffer[r-4],this.buffer[r+1]=this.buffer[r-3],this.buffer[r+2]=this.buffer[r-2],this.buffer[r+3]=this.buffer[r-1],r-=4,i>4&&(i-=4)}this.buffer[r]=t,this.buffer[r+1]=e,this.buffer[r+2]=s,this.buffer[r+3]=i}else this.buffer.push(t,e,s,i)}shift(t,e,s,i){if(131072&t)this.pushState(65535&t,this.pos);else if(262144&t)this.pos=i,this.shiftContext(e,s),e<=this.p.parser.maxNode&&this.buffer.push(e,s,i,4);else{let r=t,{parser:h}=this.p;(i>this.pos||e<=h.maxNode)&&(this.pos=i,h.stateFlag(r,1)||(this.reducePos=i)),this.pushState(r,s),this.shiftContext(e,s),e<=h.maxNode&&this.buffer.push(e,s,i,4)}}apply(t,e,s,i){65536&t?this.reduce(t):this.shift(t,e,s,i)}useNode(t,e){let s=this.p.reused.length-1;(s<0||this.p.reused[s]!=t)&&(this.p.reused.push(t),s++);let i=this.pos;this.reducePos=this.pos=i+t.length,this.pushState(e,i),this.buffer.push(s,i,this.reducePos,-1),this.curContext&&this.updateContext(this.curContext.tracker.reuse(this.curContext.context,t,this,this.p.stream.reset(this.pos-t.length)))}split(){let t=this,e=t.buffer.length;for(;e>0&&t.buffer[e-2]>t.reducePos;)e-=4;let s=t.buffer.slice(e),i=t.bufferBase+e;for(;t&&i==t.bufferBase;)t=t.parent;return new h(this.p,this.stack.slice(),this.state,this.reducePos,this.pos,this.score,s,i,this.curContext,this.lookAhead,t)}recoverByDelete(t,e){let s=t<=this.p.parser.maxNode;s&&this.storeNode(t,this.pos,e,4),this.storeNode(0,this.pos,e,s?8:4),this.pos=this.reducePos=e,this.score-=190}canShift(t){for(let e=new o(this);;){let s=this.p.parser.stateSlot(e.state,4)||this.p.parser.hasAction(e.state,t);if(0==s)return!1;if(!(65536&s))return!0;e.reduce(s)}}recoverByInsert(t){if(this.stack.length>=300)return[];let e=this.p.parser.nextStates(this.state);if(e.length>8||this.stack.length>=120){let s=[];for(let i,r=0;r<e.length;r+=2)(i=e[r+1])!=this.state&&this.p.parser.hasAction(i,t)&&s.push(e[r],i);if(this.stack.length<120)for(let t=0;s.length<8&&t<e.length;t+=2){let i=e[t+1];s.some(((t,e)=>1&e&&t==i))||s.push(e[t],i)}e=s}let s=[];for(let t=0;t<e.length&&s.length<4;t+=2){let i=e[t+1];if(i==this.state)continue;let r=this.split();r.pushState(i,this.pos),r.storeNode(0,r.pos,r.pos,4,!0),r.shiftContext(e[t],this.pos),r.reducePos=this.pos,r.score-=200,s.push(r)}return s}forceReduce(){let{parser:t}=this.p,e=t.stateSlot(this.state,5);if(!(65536&e))return!1;if(!t.validAction(this.state,e)){let s=e>>19,i=65535&e,r=this.stack.length-3*s;if(r<0||t.getGoto(this.stack[r],i,!1)<0){let t=this.findForcedReduction();if(null==t)return!1;e=t}this.storeNode(0,this.pos,this.pos,4,!0),this.score-=100}return this.reducePos=this.pos,this.reduce(e),!0}findForcedReduction(){let{parser:t}=this.p,e=[],s=(i,r)=>{if(!e.includes(i))return e.push(i),t.allActions(i,(e=>{if(393216&e);else if(65536&e){let s=(e>>19)-r;if(s>1){let i=65535&e,r=this.stack.length-3*s;if(r>=0&&t.getGoto(this.stack[r],i,!1)>=0)return s<<19|65536|i}}else{let t=s(e,r+1);if(null!=t)return t}}))};return s(this.state,0)}forceAll(){for(;!this.p.parser.stateFlag(this.state,2);)if(!this.forceReduce()){this.storeNode(0,this.pos,this.pos,4,!0);break}return this}get deadEnd(){if(3!=this.stack.length)return!1;let{parser:t}=this.p;return 65535==t.data[t.stateSlot(this.state,1)]&&!t.stateSlot(this.state,4)}restart(){this.storeNode(0,this.pos,this.pos,4,!0),this.state=this.stack[0],this.stack.length=0}sameState(t){if(this.state!=t.state||this.stack.length!=t.stack.length)return!1;for(let e=0;e<this.stack.length;e+=3)if(this.stack[e]!=t.stack[e])return!1;return!0}get parser(){return this.p.parser}dialectEnabled(t){return this.p.parser.dialect.flags[t]}shiftContext(t,e){this.curContext&&this.updateContext(this.curContext.tracker.shift(this.curContext.context,t,this,this.p.stream.reset(e)))}reduceContext(t,e){this.curContext&&this.updateContext(this.curContext.tracker.reduce(this.curContext.context,t,this,this.p.stream.reset(e)))}emitContext(){let t=this.buffer.length-1;(t<0||-3!=this.buffer[t])&&this.buffer.push(this.curContext.hash,this.pos,this.pos,-3)}emitLookAhead(){let t=this.buffer.length-1;(t<0||-4!=this.buffer[t])&&this.buffer.push(this.lookAhead,this.pos,this.pos,-4)}updateContext(t){if(t!=this.curContext.context){let e=new n(this.curContext.tracker,t);e.hash!=this.curContext.hash&&this.emitContext(),this.curContext=e}}setLookAhead(t){t>this.lookAhead&&(this.emitLookAhead(),this.lookAhead=t)}close(){this.curContext&&this.curContext.tracker.strict&&this.emitContext(),this.lookAhead>0&&this.emitLookAhead()}}class n{constructor(t,e){this.tracker=t,this.context=e,this.hash=t.strict?t.hash(e):0}}class o{constructor(t){this.start=t,this.state=t.state,this.stack=t.stack,this.base=this.stack.length}reduce(t){let e=65535&t,s=t>>19;0==s?(this.stack==this.start.stack&&(this.stack=this.stack.slice()),this.stack.push(this.state,0,0),this.base+=3):this.base-=3*(s-1);let i=this.start.p.parser.getGoto(this.stack[this.base-3],e,!0);this.state=i}}class a{constructor(t,e,s){this.stack=t,this.pos=e,this.index=s,this.buffer=t.buffer,0==this.index&&this.maybeNext()}static create(t,e=t.bufferBase+t.buffer.length){return new a(t,e,e-t.bufferBase)}maybeNext(){let t=this.stack.parent;null!=t&&(this.index=this.stack.bufferBase-t.bufferBase,this.stack=t,this.buffer=t.buffer)}get id(){return this.buffer[this.index-4]}get start(){return this.buffer[this.index-3]}get end(){return this.buffer[this.index-2]}get size(){return this.buffer[this.index-1]}next(){this.index-=4,this.pos-=4,0==this.index&&this.maybeNext()}fork(){return new a(this.stack,this.pos,this.index)}}function l(t,e=Uint16Array){if("string"!=typeof t)return t;let s=null;for(let i=0,r=0;i<t.length;){let h=0;for(;;){let e=t.charCodeAt(i++),s=!1;if(126==e){h=65535;break}e>=92&&e--,e>=34&&e--;let r=e-32;if(r>=46&&(r-=46,s=!0),h+=r,s)break;h*=46}s?s[r++]=h:s=new e(h)}return s}class c{constructor(){this.start=-1,this.value=-1,this.end=-1,this.extended=-1,this.lookAhead=0,this.mask=0,this.context=0}}const u=new c;class f{constructor(t,e){this.input=t,this.ranges=e,this.chunk="",this.chunkOff=0,this.chunk2="",this.chunk2Pos=0,this.next=-1,this.token=u,this.rangeIndex=0,this.pos=this.chunkPos=e[0].from,this.range=e[0],this.end=e[e.length-1].to,this.readNext()}resolveOffset(t,e){let s=this.range,i=this.rangeIndex,r=this.pos+t;for(;r<s.from;){if(!i)return null;let t=this.ranges[--i];r-=s.from-t.to,s=t}for(;e<0?r>s.to:r>=s.to;){if(i==this.ranges.length-1)return null;let t=this.ranges[++i];r+=t.from-s.to,s=t}return r}clipPos(t){if(t>=this.range.from&&t<this.range.to)return t;for(let e of this.ranges)if(e.to>t)return Math.max(t,e.from);return this.end}peek(t){let e,s,i=this.chunkOff+t;if(i>=0&&i<this.chunk.length)e=this.pos+t,s=this.chunk.charCodeAt(i);else{let i=this.resolveOffset(t,1);if(null==i)return-1;if(e=i,e>=this.chunk2Pos&&e<this.chunk2Pos+this.chunk2.length)s=this.chunk2.charCodeAt(e-this.chunk2Pos);else{let t=this.rangeIndex,i=this.range;for(;i.to<=e;)i=this.ranges[++t];this.chunk2=this.input.chunk(this.chunk2Pos=e),e+this.chunk2.length>i.to&&(this.chunk2=this.chunk2.slice(0,i.to-e)),s=this.chunk2.charCodeAt(0)}}return e>=this.token.lookAhead&&(this.token.lookAhead=e+1),s}acceptToken(t,e=0){let s=e?this.resolveOffset(e,-1):this.pos;if(null==s||s<this.token.start)throw new RangeError("Token end out of bounds");this.token.value=t,this.token.end=s}acceptTokenTo(t,e){this.token.value=t,this.token.end=e}getChunk(){if(this.pos>=this.chunk2Pos&&this.pos<this.chunk2Pos+this.chunk2.length){let{chunk:t,chunkPos:e}=this;this.chunk=this.chunk2,this.chunkPos=this.chunk2Pos,this.chunk2=t,this.chunk2Pos=e,this.chunkOff=this.pos-this.chunkPos}else{this.chunk2=this.chunk,this.chunk2Pos=this.chunkPos;let t=this.input.chunk(this.pos),e=this.pos+t.length;this.chunk=e>this.range.to?t.slice(0,this.range.to-this.pos):t,this.chunkPos=this.pos,this.chunkOff=0}}readNext(){return this.chunkOff>=this.chunk.length&&(this.getChunk(),this.chunkOff==this.chunk.length)?this.next=-1:this.next=this.chunk.charCodeAt(this.chunkOff)}advance(t=1){for(this.chunkOff+=t;this.pos+t>=this.range.to;){if(this.rangeIndex==this.ranges.length-1)return this.setDone();t-=this.range.to-this.pos,this.range=this.ranges[++this.rangeIndex],this.pos=this.range.from}return this.pos+=t,this.pos>=this.token.lookAhead&&(this.token.lookAhead=this.pos+1),this.readNext()}setDone(){return this.pos=this.chunkPos=this.end,this.range=this.ranges[this.rangeIndex=this.ranges.length-1],this.chunk="",this.next=-1}reset(t,e){if(e?(this.token=e,e.start=t,e.lookAhead=t+1,e.value=e.extended=-1):this.token=u,this.pos!=t){if(this.pos=t,t==this.end)return this.setDone(),this;for(;t<this.range.from;)this.range=this.ranges[--this.rangeIndex];for(;t>=this.range.to;)this.range=this.ranges[++this.rangeIndex];t>=this.chunkPos&&t<this.chunkPos+this.chunk.length?this.chunkOff=t-this.chunkPos:(this.chunk="",this.chunkOff=0),this.readNext()}return this}read(t,e){if(t>=this.chunkPos&&e<=this.chunkPos+this.chunk.length)return this.chunk.slice(t-this.chunkPos,e-this.chunkPos);if(t>=this.chunk2Pos&&e<=this.chunk2Pos+this.chunk2.length)return this.chunk2.slice(t-this.chunk2Pos,e-this.chunk2Pos);if(t>=this.range.from&&e<=this.range.to)return this.input.read(t,e);let s="";for(let i of this.ranges){if(i.from>=e)break;i.to>t&&(s+=this.input.read(Math.max(i.from,t),Math.min(i.to,e)))}return s}}class p{constructor(t,e){this.data=t,this.id=e}token(t,e){let{parser:s}=e.p;!function(t,e,s,i,r,h){let n=0,o=1<<i,{dialect:a}=s.p.parser;t:for(;o&t[n];){let s=t[n+1];for(let i=n+3;i<s;i+=2)if((t[i+1]&o)>0){let s=t[i];if(a.allows(s)&&(-1==e.token.value||e.token.value==s||g(s,e.token.value,r,h))){e.acceptToken(s);break}}let i=e.next,l=0,c=t[n+2];if(!(e.next<0&&c>l&&65535==t[s+3*c-3])){for(;l<c;){let r=l+c>>1,h=s+r+(r<<1),o=t[h],a=t[h+1]||65536;if(i<o)c=r;else{if(!(i>=a)){n=t[h+2],e.advance();continue t}l=r+1}}break}n=t[s+3*c-1]}}(this.data,t,e,this.id,s.data,s.tokenPrecTable)}}p.prototype.contextual=p.prototype.fallback=p.prototype.extend=!1,p.prototype.fallback=p.prototype.extend=!1;class d{constructor(t,e={}){this.token=t,this.contextual=!!e.contextual,this.fallback=!!e.fallback,this.extend=!!e.extend}}function k(t,e,s){for(let i,r=e;65535!=(i=t[r]);r++)if(i==s)return r-e;return-1}function g(t,e,s,i){let r=k(s,i,e);return r<0||k(s,i,t)<r}const m=void 0!==r&&r.env&&/\bparse\b/.test(r.env.LOG);let x=null;function b(t,e,s){let r=t.cursor(i.IterMode.IncludeAnonymous);for(r.moveTo(e);;)if(!(s<0?r.childBefore(e):r.childAfter(e)))for(;;){if((s<0?r.to<e:r.from>e)&&!r.type.isError)return s<0?Math.max(0,Math.min(r.to-1,e-25)):Math.min(t.length,Math.max(r.from+1,e+25));if(s<0?r.prevSibling():r.nextSibling())break;if(!r.parent())return s<0?0:t.length}}class v{constructor(t,e){this.fragments=t,this.nodeSet=e,this.i=0,this.fragment=null,this.safeFrom=-1,this.safeTo=-1,this.trees=[],this.start=[],this.index=[],this.nextFragment()}nextFragment(){let t=this.fragment=this.i==this.fragments.length?null:this.fragments[this.i++];if(t){for(this.safeFrom=t.openStart?b(t.tree,t.from+t.offset,1)-t.offset:t.from,this.safeTo=t.openEnd?b(t.tree,t.to+t.offset,-1)-t.offset:t.to;this.trees.length;)this.trees.pop(),this.start.pop(),this.index.pop();this.trees.push(t.tree),this.start.push(-t.offset),this.index.push(0),this.nextStart=this.safeFrom}else this.nextStart=1e9}nodeAt(t){if(t<this.nextStart)return null;for(;this.fragment&&this.safeTo<=t;)this.nextFragment();if(!this.fragment)return null;for(;;){let e=this.trees.length-1;if(e<0)return this.nextFragment(),null;let s=this.trees[e],r=this.index[e];if(r==s.children.length){this.trees.pop(),this.start.pop(),this.index.pop();continue}let h=s.children[r],n=this.start[e]+s.positions[r];if(n>t)return this.nextStart=n,null;if(h instanceof i.Tree){if(n==t){if(n<this.safeFrom)return null;let t=n+h.length;if(t<=this.safeTo){let e=h.prop(i.NodeProp.lookAhead);if(!e||t+e<this.fragment.to)return h}}this.index[e]++,n+h.length>=Math.max(this.safeFrom,t)&&(this.trees.push(h),this.start.push(n),this.index.push(0))}else this.index[e]++,this.nextStart=n+h.length}}}class S{constructor(t,e){this.stream=e,this.tokens=[],this.mainToken=null,this.actions=[],this.tokens=t.tokenizers.map((t=>new c))}getActions(t){let e=0,s=null,{parser:i}=t.p,{tokenizers:r}=i,h=i.stateSlot(t.state,3),n=t.curContext?t.curContext.hash:0,o=0;for(let i=0;i<r.length;i++){if(!(1<<i&h))continue;let a=r[i],l=this.tokens[i];if((!s||a.fallback)&&((a.contextual||l.start!=t.pos||l.mask!=h||l.context!=n)&&(this.updateCachedToken(l,a,t),l.mask=h,l.context=n),l.lookAhead>l.end+25&&(o=Math.max(l.lookAhead,o)),0!=l.value)){let i=e;if(l.extended>-1&&(e=this.addActions(t,l.extended,l.end,e)),e=this.addActions(t,l.value,l.end,e),!a.extend&&(s=l,e>i))break}}for(;this.actions.length>e;)this.actions.pop();return o&&t.setLookAhead(o),s||t.pos!=this.stream.end||(s=new c,s.value=t.p.parser.eofTerm,s.start=s.end=t.pos,e=this.addActions(t,s.value,s.end,e)),this.mainToken=s,this.actions}getMainToken(t){if(this.mainToken)return this.mainToken;let e=new c,{pos:s,p:i}=t;return e.start=s,e.end=Math.min(s+1,i.stream.end),e.value=s==i.stream.end?i.parser.eofTerm:0,e}updateCachedToken(t,e,s){let i=this.stream.clipPos(s.pos);if(e.token(this.stream.reset(i,t),s),t.value>-1){let{parser:e}=s.p;for(let i=0;i<e.specialized.length;i++)if(e.specialized[i]==t.value){let r=e.specializers[i](this.stream.read(t.start,t.end),s);if(r>=0&&s.p.parser.dialect.allows(r>>1)){1&r?t.extended=r>>1:t.value=r>>1;break}}}else t.value=0,t.end=this.stream.clipPos(i+1)}putAction(t,e,s,i){for(let e=0;e<i;e+=3)if(this.actions[e]==t)return i;return this.actions[i++]=t,this.actions[i++]=e,this.actions[i++]=s,i}addActions(t,e,s,i){let{state:r}=t,{parser:h}=t.p,{data:n}=h;for(let t=0;t<2;t++)for(let o=h.stateSlot(r,t?2:1);;o+=3){if(65535==n[o]){if(1!=n[o+1]){0==i&&2==n[o+1]&&(i=this.putAction(w(n,o+2),e,s,i));break}o=w(n,o+2)}n[o]==e&&(i=this.putAction(w(n,o+1),e,s,i))}return i}}class P{constructor(t,e,s,i){this.parser=t,this.input=e,this.ranges=i,this.recovering=0,this.nextStackID=9812,this.minStackPos=0,this.reused=[],this.stoppedAt=null,this.lastBigReductionStart=-1,this.lastBigReductionSize=0,this.bigReductionCount=0,this.stream=new f(e,i),this.tokens=new S(t,this.stream),this.topTerm=t.top[1];let{from:r}=i[0];this.stacks=[h.start(this,t.top[0],r)],this.fragments=s.length&&this.stream.end-r>4*t.bufferLength?new v(s,t.nodeSet):null}get parsedPos(){return this.minStackPos}advance(){let t,e,s=this.stacks,i=this.minStackPos,r=this.stacks=[];if(this.bigReductionCount>300&&1==s.length){let[t]=s;for(;t.forceReduce()&&t.stack.length&&t.stack[t.stack.length-2]>=this.lastBigReductionStart;);this.bigReductionCount=this.lastBigReductionSize=0}for(let h=0;h<s.length;h++){let n=s[h];for(;;){if(this.tokens.mainToken=null,n.pos>i)r.push(n);else{if(this.advanceStack(n,r,s))continue;{t||(t=[],e=[]),t.push(n);let s=this.tokens.getMainToken(n);e.push(s.value,s.end)}}break}}if(!r.length){let e=t&&function(t){let e=null;for(let s of t){let t=s.p.stoppedAt;(s.pos==s.p.stream.end||null!=t&&s.pos>t)&&s.p.parser.stateFlag(s.state,2)&&(!e||e.score<s.score)&&(e=s)}return e}(t);if(e)return m&&console.log("Finish with "+this.stackID(e)),this.stackToTree(e);if(this.parser.strict)throw m&&t&&console.log("Stuck with token "+(this.tokens.mainToken?this.parser.getName(this.tokens.mainToken.value):"none")),new SyntaxError("No parse at "+i);this.recovering||(this.recovering=5)}if(this.recovering&&t){let s=null!=this.stoppedAt&&t[0].pos>this.stoppedAt?t[0]:this.runRecovery(t,e,r);if(s)return m&&console.log("Force-finish "+this.stackID(s)),this.stackToTree(s.forceAll())}if(this.recovering){let t=1==this.recovering?1:3*this.recovering;if(r.length>t)for(r.sort(((t,e)=>e.score-t.score));r.length>t;)r.pop();r.some((t=>t.reducePos>i))&&this.recovering--}else if(r.length>1){t:for(let t=0;t<r.length-1;t++){let e=r[t];for(let s=t+1;s<r.length;s++){let i=r[s];if(e.sameState(i)||e.buffer.length>500&&i.buffer.length>500){if(!((e.score-i.score||e.buffer.length-i.buffer.length)>0)){r.splice(t--,1);continue t}r.splice(s--,1)}}}r.length>12&&r.splice(12,r.length-12)}this.minStackPos=r[0].pos;for(let t=1;t<r.length;t++)r[t].pos<this.minStackPos&&(this.minStackPos=r[t].pos);return null}stopAt(t){if(null!=this.stoppedAt&&this.stoppedAt<t)throw new RangeError("Can't move stoppedAt forward");this.stoppedAt=t}advanceStack(t,e,s){let r=t.pos,{parser:h}=this,n=m?this.stackID(t)+" -> ":"";if(null!=this.stoppedAt&&r>this.stoppedAt)return t.forceReduce()?t:null;if(this.fragments){let e=t.curContext&&t.curContext.tracker.strict,s=e?t.curContext.hash:0;for(let o=this.fragments.nodeAt(r);o;){let r=this.parser.nodeSet.types[o.type.id]==o.type?h.getGoto(t.state,o.type.id):-1;if(r>-1&&o.length&&(!e||(o.prop(i.NodeProp.contextHash)||0)==s))return t.useNode(o,r),m&&console.log(n+this.stackID(t)+` (via reuse of ${h.getName(o.type.id)})`),!0;if(!(o instanceof i.Tree)||0==o.children.length||o.positions[0]>0)break;let a=o.children[0];if(!(a instanceof i.Tree&&0==o.positions[0]))break;o=a}}let o=h.stateSlot(t.state,4);if(o>0)return t.reduce(o),m&&console.log(n+this.stackID(t)+` (via always-reduce ${h.getName(65535&o)})`),!0;if(t.stack.length>=8400)for(;t.stack.length>6e3&&t.forceReduce(););let a=this.tokens.getActions(t);for(let i=0;i<a.length;){let o=a[i++],l=a[i++],c=a[i++],u=i==a.length||!s,f=u?t:t.split(),p=this.tokens.mainToken;if(f.apply(o,l,p?p.start:f.pos,c),m&&console.log(n+this.stackID(f)+` (via ${65536&o?`reduce of ${h.getName(65535&o)}`:"shift"} for ${h.getName(l)} @ ${r}${f==t?"":", split"})`),u)return!0;f.pos>r?e.push(f):s.push(f)}return!1}advanceFully(t,e){let s=t.pos;for(;;){if(!this.advanceStack(t,null,null))return!1;if(t.pos>s)return T(t,e),!0}}runRecovery(t,e,s){let i=null,r=!1;for(let h=0;h<t.length;h++){let n=t[h],o=e[h<<1],a=e[1+(h<<1)],l=m?this.stackID(n)+" -> ":"";if(n.deadEnd){if(r)continue;if(r=!0,n.restart(),m&&console.log(l+this.stackID(n)+" (restarted)"),this.advanceFully(n,s))continue}let c=n.split(),u=l;for(let t=0;c.forceReduce()&&t<10&&(m&&console.log(u+this.stackID(c)+" (via force-reduce)"),!this.advanceFully(c,s));t++)m&&(u=this.stackID(c)+" -> ");for(let t of n.recoverByInsert(o))m&&console.log(l+this.stackID(t)+" (via recover-insert)"),this.advanceFully(t,s);this.stream.end>n.pos?(a==n.pos&&(a++,o=0),n.recoverByDelete(o,a),m&&console.log(l+this.stackID(n)+` (via recover-delete ${this.parser.getName(o)})`),T(n,s)):(!i||i.score<n.score)&&(i=n)}return i}stackToTree(t){return t.close(),i.Tree.build({buffer:a.create(t),nodeSet:this.parser.nodeSet,topID:this.topTerm,maxBufferLength:this.parser.bufferLength,reused:this.reused,start:this.ranges[0].from,length:t.pos-this.ranges[0].from,minRepeatType:this.parser.minRepeatTerm})}stackID(t){let e=(x||(x=new WeakMap)).get(t);return e||x.set(t,e=String.fromCodePoint(this.nextStackID++)),e+t}}function T(t,e){for(let s=0;s<e.length;s++){let i=e[s];if(i.pos==t.pos&&i.sameState(t))return void(e[s].score<t.score&&(e[s]=t))}e.push(t)}class y{constructor(t,e,s){this.source=t,this.flags=e,this.disabled=s}allows(t){return!this.disabled||0==this.disabled[t]}}class A extends i.Parser{constructor(t){if(super(),this.wrappers=[],14!=t.version)throw new RangeError(`Parser version (${t.version}) doesn't match runtime version (14)`);let e=t.nodeNames.split(" ");this.minRepeatTerm=e.length;for(let s=0;s<t.repeatNodeCount;s++)e.push("");let s=Object.keys(t.topRules).map((e=>t.topRules[e][1])),r=[];for(let t=0;t<e.length;t++)r.push([]);function h(t,e,s){r[t].push([e,e.deserialize(String(s))])}if(t.nodeProps)for(let e of t.nodeProps){let t=e[0];"string"==typeof t&&(t=i.NodeProp[t]);for(let s=1;s<e.length;){let i=e[s++];if(i>=0)h(i,t,e[s++]);else{let r=e[s+-i];for(let n=-i;n>0;n--)h(e[s++],t,r);s++}}}this.nodeSet=new i.NodeSet(e.map(((e,h)=>i.NodeType.define({name:h>=this.minRepeatTerm?void 0:e,id:h,props:r[h],top:s.indexOf(h)>-1,error:0==h,skipped:t.skippedNodes&&t.skippedNodes.indexOf(h)>-1})))),t.propSources&&(this.nodeSet=this.nodeSet.extend(...t.propSources)),this.strict=!1,this.bufferLength=i.DefaultBufferLength;let n=l(t.tokenData);this.context=t.context,this.specializerSpecs=t.specialized||[],this.specialized=new Uint16Array(this.specializerSpecs.length);for(let t=0;t<this.specializerSpecs.length;t++)this.specialized[t]=this.specializerSpecs[t].term;this.specializers=this.specializerSpecs.map(C),this.states=l(t.states,Uint32Array),this.data=l(t.stateData),this.goto=l(t.goto),this.maxTerm=t.maxTerm,this.tokenizers=t.tokenizers.map((t=>"number"==typeof t?new p(n,t):t)),this.topRules=t.topRules,this.dialects=t.dialects||{},this.dynamicPrecedences=t.dynamicPrecedences||null,this.tokenPrecTable=t.tokenPrec,this.termNames=t.termNames||null,this.maxNode=this.nodeSet.types.length-1,this.dialect=this.parseDialect(),this.top=this.topRules[Object.keys(this.topRules)[0]]}createParse(t,e,s){let i=new P(this,t,e,s);for(let r of this.wrappers)i=r(i,t,e,s);return i}getGoto(t,e,s=!1){let i=this.goto;if(e>=i[0])return-1;for(let r=i[e+1];;){let e=i[r++],h=1&e,n=i[r++];if(h&&s)return n;for(let s=r+(e>>1);r<s;r++)if(i[r]==t)return n;if(h)return-1}}hasAction(t,e){let s=this.data;for(let i=0;i<2;i++)for(let r,h=this.stateSlot(t,i?2:1);;h+=3){if(65535==(r=s[h])){if(1!=s[h+1]){if(2==s[h+1])return w(s,h+2);break}r=s[h=w(s,h+2)]}if(r==e||0==r)return w(s,h+1)}return 0}stateSlot(t,e){return this.states[6*t+e]}stateFlag(t,e){return(this.stateSlot(t,0)&e)>0}validAction(t,e){return!!this.allActions(t,(t=>t==e||null))}allActions(t,e){let s=this.stateSlot(t,4),i=s?e(s):void 0;for(let s=this.stateSlot(t,1);null==i;s+=3){if(65535==this.data[s]){if(1!=this.data[s+1])break;s=w(this.data,s+2)}i=e(w(this.data,s+1))}return i}nextStates(t){let e=[];for(let s=this.stateSlot(t,1);;s+=3){if(65535==this.data[s]){if(1!=this.data[s+1])break;s=w(this.data,s+2)}if(!(1&this.data[s+2])){let t=this.data[s+1];e.some(((e,s)=>1&s&&e==t))||e.push(this.data[s],t)}}return e}configure(t){let e=Object.assign(Object.create(A.prototype),this);if(t.props&&(e.nodeSet=this.nodeSet.extend(...t.props)),t.top){let s=this.topRules[t.top];if(!s)throw new RangeError(`Invalid top rule name ${t.top}`);e.top=s}return t.tokenizers&&(e.tokenizers=this.tokenizers.map((e=>{let s=t.tokenizers.find((t=>t.from==e));return s?s.to:e}))),t.specializers&&(e.specializers=this.specializers.slice(),e.specializerSpecs=this.specializerSpecs.map(((s,i)=>{let r=t.specializers.find((t=>t.from==s.external));if(!r)return s;let h=Object.assign(Object.assign({},s),{external:r.to});return e.specializers[i]=C(h),h}))),t.contextTracker&&(e.context=t.contextTracker),t.dialect&&(e.dialect=this.parseDialect(t.dialect)),null!=t.strict&&(e.strict=t.strict),t.wrap&&(e.wrappers=e.wrappers.concat(t.wrap)),null!=t.bufferLength&&(e.bufferLength=t.bufferLength),e}hasWrappers(){return this.wrappers.length>0}getName(t){return this.termNames?this.termNames[t]:String(t<=this.maxNode&&this.nodeSet.types[t].name||t)}get eofTerm(){return this.maxNode+1}get topNode(){return this.nodeSet.types[this.top[1]]}dynamicPrecedence(t){let e=this.dynamicPrecedences;return null==e?0:e[t]||0}parseDialect(t){let e=Object.keys(this.dialects),s=e.map((()=>!1));if(t)for(let i of t.split(" ")){let t=e.indexOf(i);t>=0&&(s[t]=!0)}let i=null;for(let t=0;t<e.length;t++)if(!s[t])for(let s,r=this.dialects[e[t]];65535!=(s=this.data[r++]);)(i||(i=new Uint8Array(this.maxTerm+1)))[s]=1;return new y(t,s,i)}static deserialize(t){return new A(t)}}function w(t,e){return t[e]|t[e+1]<<16}function C(t){if(t.external){let e=t.extend?1:0;return(s,i)=>t.external(s,i)<<1|e}return t.get}},606:t=>{var e,s,i=t.exports={};function r(){throw new Error("setTimeout has not been defined")}function h(){throw new Error("clearTimeout has not been defined")}function n(t){if(e===setTimeout)return setTimeout(t,0);if((e===r||!e)&&setTimeout)return e=setTimeout,setTimeout(t,0);try{return e(t,0)}catch(s){try{return e.call(null,t,0)}catch(s){return e.call(this,t,0)}}}!function(){try{e="function"==typeof setTimeout?setTimeout:r}catch(t){e=r}try{s="function"==typeof clearTimeout?clearTimeout:h}catch(t){s=h}}();var o,a=[],l=!1,c=-1;function u(){l&&o&&(l=!1,o.length?a=o.concat(a):c=-1,a.length&&f())}function f(){if(!l){var t=n(u);l=!0;for(var e=a.length;e;){for(o=a,a=[];++c<e;)o&&o[c].run();c=-1,e=a.length}o=null,l=!1,function(t){if(s===clearTimeout)return clearTimeout(t);if((s===h||!s)&&clearTimeout)return s=clearTimeout,clearTimeout(t);try{return s(t)}catch(e){try{return s.call(null,t)}catch(e){return s.call(this,t)}}}(t)}}function p(t,e){this.fun=t,this.array=e}function d(){}i.nextTick=function(t){var e=new Array(arguments.length-1);if(arguments.length>1)for(var s=1;s<arguments.length;s++)e[s-1]=arguments[s];a.push(new p(t,e)),1!==a.length||l||n(f)},p.prototype.run=function(){this.fun.apply(null,this.array)},i.title="browser",i.browser=!0,i.env={},i.argv=[],i.version="",i.versions={},i.on=d,i.addListener=d,i.once=d,i.off=d,i.removeListener=d,i.removeAllListeners=d,i.emit=d,i.prependListener=d,i.prependOnceListener=d,i.listeners=function(t){return[]},i.binding=function(t){throw new Error("process.binding is not supported")},i.cwd=function(){return"/"},i.chdir=function(t){throw new Error("process.chdir is not supported")},i.umask=function(){return 0}}}]);