;(function ($, window, undefined) {
$.noop = $.noop || function () {}; // jQuery 1.3.2
var _box, _thisScript, _skin, _path,
	_count = 0,
	_$window = $(window),
	_$document = $(document),
	_$html = $('html'),
	_elem = document.documentElement,
	_isIE6 = window.VBArray && !window.XMLHttpRequest,
	_ismobile = 'createTouch' in document && !('onmousemove' in _elem)
		|| /(iPhone|iPad|iPod)/i.test(navigator.userAgent),
	_expando = 'artDialog' + + new Date;

var artDialog = function (config, ok, cancel) {
	config = config || {};
	
	if (typeof config === 'string' || config.nodeType === 1) {
		config = {content: config, fixed: !_ismobile};
	};
	
	var api,
		defaults = artDialog.defaults,
		elem = config.follow = this.nodeType === 1 && this || config.follow;
		
	// 合并默认配置
	for (var i in defaults) {
		if (config[i] === undefined) config[i] = defaults[i];		
	};
	
	// 兼容v4.1.0之前的参数，未来版本将删除此
	$.each({ok:"yesFn",cancel:"noFn",close:"closeFn",init:"initFn",okVal:"yesText",cancelVal:"noText"},
	function(i,o){config[i]=config[i]!==undefined?config[i]:config[o]});
	
	// 返回跟随模式或重复定义的ID
	if (typeof elem === 'string') elem = $(elem)[0];
	config.id = elem && elem[_expando + 'follow'] || config.id || _expando + _count;
	api = artDialog.list[config.id];
	if (elem && api) return api.follow(elem).zIndex().focus();
	if (api) return api.zIndex().focus();

	// 目前主流移动设备对fixed支持不好
	if (_ismobile) config.fixed = false;
	
	// 按钮队列
	if (!$.isArray(config.button)) {
		config.button = config.button ? [config.button] : [];
	};
	if (ok !== undefined) config.ok = ok;
	if (cancel !== undefined) config.cancel = cancel;
	config.ok && config.button.push({
		name: config.okVal,
		callback: config.ok,
		focus: true
	});
	config.cancel && config.button.push({
		name: config.cancelVal,
		callback: config.cancel
	});
	
	// zIndex全局配置
	artDialog.defaults.zIndex = config.zIndex;
	
	_count ++;
	
	return artDialog.list[config.id] = _box ?
		_box._init(config) : new artDialog.fn._init(config);
};

artDialog.fn = artDialog.prototype = {

	version: '4.1.6',
	
	closed: true,
	
	_init: function (config) {
		var that = this, DOM,
			icon = config.icon,
			iconBg = icon && (_isIE6 ? {png: 'icons/' + icon + '.png'}
			: {backgroundImage: 'url(\'' + config.path + '/skin/icons/' + icon + '.png\')'});
		
        that.closed = false;
		that.config = config;
		that.DOM = DOM = that.DOM || that._getDOM();
		
		DOM.wrap.addClass(config.skin);
		DOM.close[config.cancel === false ? 'hide' : 'show']();
		DOM.icon[0].style.display = icon ? '' : 'none';
		DOM.iconBg.css(iconBg || {background: 'none'});
		DOM.se.css('cursor', config.resize ? 'se-resize' : 'auto');
		DOM.title.css('cursor', config.drag ? 'move' : 'auto');
		DOM.content.css('padding', config.padding);
		
		config.min ? DOM.min.show() : DOM.min.hide();
		config.max ? DOM.max.show() : DOM.max.hide();

		that[config.show ? 'show' : 'hide'](true)
		that.button(config.button)
		.title(config.title)
		.id(config.id)
		.content(config.content, true)
		.size(config.width, config.height)
		.time(config.time);
		
		config.follow
		? that.follow(config.follow)
		: that.position(config.left, config.top);
		
		that.zIndex().focus();
		config.lock && that.lock();
		
		that._addEvent();
		that._ie6PngFix();
		_box = null;
		
		config.init && config.init.call(that, window);
		return that;
	},
	
	/**
	 * 设置内容
	 * @param	{String, HTMLElement}	内容 (可选)
	 * @return	{this, HTMLElement}		如果无参数则返回内容容器DOM对象
	 */
	content: function (msg) {
		var prev, next, parent, display,
			that = this,
			DOM = that.DOM,
			wrap = DOM.wrap[0],
			width = wrap.offsetWidth,
			height = wrap.offsetHeight,
			left = parseInt(wrap.style.left),
			top = parseInt(wrap.style.top),
			cssWidth = wrap.style.width,
			$content = DOM.content,
			content = $content[0];
		
		that._elemBack && that._elemBack();
		wrap.style.width = 'auto';
		
		if (msg === undefined) return content;
		if (typeof msg === 'string') {
			$content.html(msg);
		} else if (msg && msg.nodeType === 1) {
		
			// 让传入的元素在对话框关闭后可以返回到原来的地方
			display = msg.style.display;
			prev = msg.previousSibling;
			next = msg.nextSibling;
			parent = msg.parentNode;
			that._elemBack = function () {
				if (prev && prev.parentNode) {
					prev.parentNode.insertBefore(msg, prev.nextSibling);
				} else if (next && next.parentNode) {
					next.parentNode.insertBefore(msg, next);
				} else if (parent) {
					parent.appendChild(msg);
				};
				msg.style.display = display;
				that._elemBack = null;
			};
			
			$content.html('');
			content.appendChild(msg);
			msg.style.display = 'block';
			
		};
		
		// 新增内容后调整位置
		if (!arguments[1]) {
			if (that.config.follow) {
				that.follow(that.config.follow);
			} else {
				width = wrap.offsetWidth - width;
				height = wrap.offsetHeight - height;
				left = left - width / 2;
				top = top - height / 2;
				wrap.style.left = Math.max(left, 0) + 'px';
				wrap.style.top = Math.max(top, 0) + 'px';
			};
			if (cssWidth && cssWidth !== 'auto') {
				wrap.style.width = wrap.offsetWidth + 'px';
			};
			that._autoPositionType();
		};
		
		that._ie6SelectFix();
		that._runScript(content);
		
		return that;
	},
	
	/**
	 * 设置标题
	 * @param	{String, Boolean}	标题内容. 为false则隐藏标题栏
	 * @return	{this, HTMLElement}	如果无参数则返回内容器DOM对象
	 */
	title: function (text) {
		var DOM = this.DOM,
			wrap = DOM.wrap,
			title = DOM.title,
			className = 'aui_state_notitle';
			
		if (text === undefined) return title[0];
		if (text === false) {
			title.hide().html('');
			wrap.addClass(className);
		} else {
			title.show().html(text || '');
			wrap.removeClass(className);
		};
		
		return this;
	},

	id: function (text) {
			id = text
		return this;
	},

	/**
	 * 位置(相对于可视区域)
	 * @param	{Number, String}
	 * @param	{Number, String}
	 */
	position: function (left, top) {
		var that = this,
			config = that.config,
			wrap = that.DOM.wrap[0],
			isFixed = _isIE6 ? false : config.fixed,
			ie6Fixed = _isIE6 && that.config.fixed,
			docLeft = _$document.scrollLeft(),
			docTop = _$document.scrollTop(),
			dl = isFixed ? 0 : docLeft,
			dt = isFixed ? 0 : docTop,
			ww = _$window.width(),
			wh = _$window.height(),
			ow = wrap.offsetWidth,
			oh = wrap.offsetHeight,
			style = wrap.style;
		
		if (left || left === 0) {
			that._left = left.toString().indexOf('%') !== -1 ? left : null;
			left = that._toNumber(left, ww - ow);
			
			if (typeof left === 'number') {
				left = ie6Fixed ? (left += docLeft) : left + dl;
				style.left = Math.max(left, dl) + 'px';
			} else if (typeof left === 'string') {
				style.left = left;
			};
		};
		
		if (top || top === 0) {
			that._top = top.toString().indexOf('%') !== -1 ? top : null;
			top = that._toNumber(top, wh - oh);
			
			if (typeof top === 'number') {
				top = ie6Fixed ? (top += docTop) : top + dt;
				style.top = Math.max(top, dt) + 'px';
			} else if (typeof top === 'string') {
				style.top = top;
			};
		};
		
		if (left !== undefined && top !== undefined) {
			that._follow = null;
			that._autoPositionType();
		};
		
		return that;
	},

	/**
	 *	尺寸
	 *	@param	{Number, String}	宽度
	 *	@param	{Number, String}	高度
	 */
	size: function (width, height) {
		var maxWidth, maxHeight, scaleWidth, scaleHeight,
			that = this,
			config = that.config,
			DOM = that.DOM,
			wrap = DOM.wrap,
			main = DOM.main,
			wrapStyle = wrap[0].style,
			style = main[0].style;
			
		if (width) {
			that._width = width.toString().indexOf('%') !== -1 ? width : null;
			maxWidth = $(window).width() - 10;
			scaleWidth = that._toNumber(width, maxWidth);
			width = scaleWidth;
			
			if(width>=maxWidth){
			width = maxWidth;
			}
			
			if (typeof width === 'number') {
				wrapStyle.width = 'auto';
				style.width = Math.max(that.config.minWidth, width) + 'px';
				wrapStyle.width = wrap[0].offsetWidth + 'px'; // 防止未定义宽度的表格遇到浏览器右边边界伸缩
			} else if (typeof width === 'string') {
				style.width = width;
				width === 'auto' && wrap.css('width', 'auto');
			};
		};
		
		if (height) {
			that._height = height.toString().indexOf('%') !== -1 ? height : null;
			maxHeight = $(window).height() - 37;
			scaleHeight = that._toNumber(height, maxHeight);
			height = scaleHeight;
			
			if(height>=maxHeight){
			height = maxHeight;
			}
			
			if (typeof height === 'number') {
				style.height = Math.max(that.config.minHeight, height) + 'px';
			} else if (typeof height === 'string') {
				style.height = height;
			};
		};
		
		that._ie6SelectFix();
		
		return that;
	},
	
	/**
	 * 跟随元素
	 * @param	{HTMLElement, String}
	 */
	follow: function (elem) {
		var $elem, that = this, config = that.config;
		
		if (typeof elem === 'string' || elem && elem.nodeType === 1) {
			$elem = $(elem);
			elem = $elem[0];
		};
		
		// 隐藏元素不可用
		if (!elem || !elem.offsetWidth && !elem.offsetHeight) {
			return that.position(that._left, that._top);
		};
		
		var expando = _expando + 'follow',
			winWidth = _$window.width(),
			winHeight = _$window.height(),
			docLeft =  _$document.scrollLeft(),
			docTop = _$document.scrollTop(),
			offset = $elem.offset(),
			width = elem.offsetWidth,
			height = elem.offsetHeight,
			isFixed = _isIE6 ? false : config.fixed,
			left = isFixed ? offset.left - docLeft : offset.left,
			top = isFixed ? offset.top - docTop : offset.top,
			wrap = that.DOM.wrap[0],
			style = wrap.style,
			wrapWidth = wrap.offsetWidth,
			wrapHeight = wrap.offsetHeight,
			setLeft = left - (wrapWidth - width) / 2,
			setTop = top + height,
			dl = isFixed ? 0 : docLeft,
			dt = isFixed ? 0 : docTop;
		
		setLeft = setLeft < dl ? left :
		(setLeft + wrapWidth > winWidth) && (left - wrapWidth > dl)
		? left - wrapWidth + width
		: setLeft;

		setTop = (setTop + wrapHeight > winHeight + dt)
		&& (top - wrapHeight > dt)
		? top - wrapHeight
		: setTop;
		
		style.left = setLeft + 'px';
		style.top = setTop + 'px';
		
		that._follow && that._follow.removeAttribute(expando);
		that._follow = elem;
		elem[expando] = config.id;
		that._autoPositionType();
		return that;
	},
	
	/**
	 * 自定义按钮
	 * @example
		button({
			name: 'login',
			callback: function () {},
			disabled: false,
			focus: true
		}, .., ..)
	 */
	button: function () {
		var that = this,
			ags = arguments,
			DOM = that.DOM,
			buttons = DOM.buttons,
			elem = buttons[0],
			strongButton = 'aui_state_highlight',
			listeners = that._listeners = that._listeners || {},
			list = $.isArray(ags[0]) ? ags[0] : [].slice.call(ags);
		
		if (ags[0] === undefined) return elem;
		$.each(list, function (i, val) {
			var name = val.name,
				isNewButton = !listeners[name],
				button = !isNewButton ?
					listeners[name].elem :
					document.createElement('button');
					
			if (!listeners[name]) listeners[name] = {};
			if (val.callback) listeners[name].callback = val.callback;
			if (val.className) button.className = val.className;
			if (val.focus) {
				that._focus && that._focus.removeClass(strongButton);
				that._focus = $(button).addClass(strongButton);
				that.focus();
			};
			
			// Internet Explorer 的默认类型是 "button"，
			// 而其他浏览器中（包括 W3C 规范）的默认值是 "submit"
			// @see http://www.w3school.com.cn/tags/att_button_type.asp
			button.setAttribute('type', 'button');
			
			button[_expando + 'callback'] = name;
			button.disabled = !!val.disabled;

			if (isNewButton) {
				button.innerHTML = name;
				listeners[name].elem = button;
				elem.appendChild(button);
			};
		});
		
		buttons[0].style.display = list.length ? '' : 'none';
		
		that._ie6SelectFix();
		return that;
	},
	
	/** 显示对话框 */
	show: function () {
		this.DOM.wrap.show();
		!arguments[0] && this._lockMaskWrap && this._lockMaskWrap.show();
		return this;
	},
	
	/** 隐藏对话框 */
	hide: function () {
		this.DOM.wrap.hide();
		!arguments[0] && this._lockMaskWrap && this._lockMaskWrap.hide();
		return this;
	},
	
	/** 关闭对话框 */
	close: function () {
		if (this.closed) return this;
		
		var that = this,
			DOM = that.DOM,
			wrap = DOM.wrap,
			list = artDialog.list,
			fn = that.config.close,
			follow = that.config.follow;
		
		that.time();
		if (typeof fn === 'function' && fn.call(that, window) === false) {
			return that;
		};
		
		that.unlock();
		
		// 置空内容
		that._elemBack && that._elemBack();
		wrap[0].className = wrap[0].style.cssText = '';
		DOM.title.html('');
		DOM.content.html('');
		DOM.buttons.html('');
		
		if (artDialog.focus === that) artDialog.focus = null;
		if (follow) follow.removeAttribute(_expando + 'follow');
		delete list[that.config.id];
		that._removeEvent();
		that.hide(true)._setAbsolute();
		
		// 清空除this.DOM之外临时对象，恢复到初始状态，以便使用单例模式
		for (var i in that) {
			if (that.hasOwnProperty(i) && i !== 'DOM') delete that[i];
		};
		
		// 移除HTMLElement或重用
		_box ? wrap.remove() : _box = that;
		
		return that;
	},

    //新增 最大化
	max: function () {
	    var that = this,
            DOM = that.DOM;
	    var border = jQuery(DOM.content[0]); // 获取 artDialog 窗口的 iframe 对象
	    var max = jQuery(DOM.max[0]);        // 获取最大化按钮对象
	    if (max.attr('state') == 'false') {  // 判断是否已最大化
	        max.attr('_width', border.width());   // 记录当前窗口定义的宽度
	        max.attr('_height', border.height()); // 记录当前窗口定义的高度
	        max.attr('state', 'true');            // 修改最大化按钮状态为真
	        this.position(0, 0);                  // 将窗口移动到左上角
	        this.size('100%', ($(window).height()-40-38)+'px');            // 修改窗口大小
        } else {
	        jQuery(DOM.border[0]).parent().parent().css('width', (max.attr('_width') * 1) + 'px');  // 修改窗口最外层 div 定义的宽度，这个 div 是窗口外层的样式窗口，比我们定义的窗口宽上 30 像素，根据使用的皮肤不同有所区别
	        this.size(max.attr('_width') + 'px', max.attr('_height') + 'px');  // 将窗口大小按照已记录的宽和高进行设置
	        this.position('50%', '50%');       // 将窗口居中
	        max.attr('state', 'false');        // 设置最大化状态为假
	        max.removeAttr('_width');          // 删除已记录的宽
	        max.removeAttr('_height');         // 删除已记录的高
        }
	    return that;
	},
	//最小化
	min: function () {
	    var that = this,
            DOM = that.DOM;
	    var border = jQuery(DOM.content[0]); // 获取 artDialog 窗口的 iframe 对象
	    var min = jQuery(DOM.min[0]);        // 获取最小化按钮对象

	        jQuery(DOM.border[0]).parent().parent().css('display', 'none');

	    return that;
	},

	/**
	 * 定时关闭
	 * @param	{Number}	单位为秒, 无参数则停止计时器
	 */
	time: function (second) {
		var that = this,
			cancel = that.config.cancelVal,
			timer = that._timer;
			
		timer && clearTimeout(timer);
		
		if (second) {
			that._timer = setTimeout(function(){
				that._click(cancel);
			}, 1000 * second);
		};
		
		return that;
	},
	
	/** 设置焦点 */
	focus: function () {
		try {
			var elem = this._focus && this._focus[0] || this.DOM.close[0];
			elem && elem.focus();
		} catch (e) {}; // IE对不可见元素设置焦点会报错
		return this;
	},
	
	/** 置顶对话框 */
	zIndex: function () {
		var that = this,
			DOM = that.DOM,
			wrap = DOM.wrap,
			top = artDialog.focus,
			index = artDialog.defaults.zIndex ++;

		//控制子窗口
		//if($(".dOpen"+that.config.id).length>0&&$(".dOpen"+that.config.id).hasClass("aui_state_focus")){ return false;}
			
		if($(".desk_page").length>=1){
			
			var listdata = '';
			$(".desk_page").each(function(){
			   listdata += parseInt($(this).css("z-index")) + ",";
			   return listdata;
			});
			var indexarr = listdata.split(',');
			var nowZindex = Math.max.apply(null,indexarr)+1;
			if(index<nowZindex){
				index = nowZindex;
			}

		}
		
		//设置叠加高度
		wrap.addClass('desk_page');
		wrap.addClass("d"+id);
		wrap.css('zIndex', index);
		
		that._lockMask && that._lockMask.css('zIndex', index - 1);
		
		// 设置最高层的样式
		top && top.DOM.wrap.removeClass('aui_state_focus');
		artDialog.focus = that;
		wrap.addClass('aui_state_focus');
		
		return that;
	},
	
	/** 设置屏锁 */
	lock: function () {
		if (this._lock) return this;
		
		var that = this,
			index = artDialog.defaults.zIndex - 1,
			wrap = that.DOM.wrap,
			config = that.config,
			docwidth = _$document.width(),
			docHeight = _$document.height(),
			lockMaskWrap = that._lockMaskWrap || $(document.body.appendChild(document.createElement('div'))),
			lockMask = that._lockMask || $(lockMaskWrap[0].appendChild(document.createElement('div'))),
			domTxt = '(document).documentElement',
			sizeCss = _ismobile ? 'width:' + docwidth + 'px;height:' + docHeight
				+ 'px' : 'width:100%;height:100%',
			ie6Css = _isIE6 ?
				'position:absolute;left:expression(' + domTxt + '.scrollLeft);top:expression('
				+ domTxt + '.scrollTop);width:expression(' + domTxt
				+ '.clientWidth);height:expression(' + domTxt + '.clientHeight)'
			: '';
		
		that.zIndex();
		wrap.addClass('aui_state_lock');
		
		lockMaskWrap[0].style.cssText = sizeCss + ';position:fixed;z-index:'
			+ index + ';top:0;left:0;overflow:hidden;' + ie6Css;
		lockMask[0].style.cssText = 'height:100%;background:' + config.background
			+ ';filter:alpha(opacity=0);opacity:0';
		
		// 让IE6锁屏遮罩能够盖住下拉控件
		if (_isIE6) lockMask.html(
			'<iframe src="about:blank" style="width:100%;height:100%;position:absolute;' +
			'top:0;left:0;z-index:-1;filter:alpha(opacity=0)"></iframe>');
			
		lockMask.stop();
		lockMask.bind('click', function () {
			that._reset();
		}).bind('dblclick', function () {
			that._click(that.config.cancelVal);
		});
		
		if (config.duration === 0) {
			lockMask.css({opacity: config.opacity});
		} else {
			lockMask.animate({opacity: config.opacity}, config.duration);
		};
		
		that._lockMaskWrap = lockMaskWrap;
		that._lockMask = lockMask;
		
		that._lock = true;
		return that;
	},
	
	/** 解开屏锁 */
	unlock: function () {
		var that = this,
			lockMaskWrap = that._lockMaskWrap,
			lockMask = that._lockMask;
		
		if (!that._lock) return that;
		var style = lockMaskWrap[0].style;
		var un = function () {
			if (_isIE6) {
				style.removeExpression('width');
				style.removeExpression('height');
				style.removeExpression('left');
				style.removeExpression('top');
			};
			style.cssText = 'display:none';
			
			_box && lockMaskWrap.remove();
		};
		
		lockMask.stop().unbind();
		that.DOM.wrap.removeClass('aui_state_lock');
		if (!that.config.duration) {// 取消动画，快速关闭
			un();
		} else {
			lockMask.animate({opacity: 0}, that.config.duration, un);
		};
		
		that._lock = false;
		return that;
	},
	
	// 获取元素
	_getDOM: function () {	
		var wrap = document.createElement('div'),
			body = document.body;
		wrap.style.cssText = 'position:absolute;left:0;top:0';
		wrap.innerHTML = artDialog._templates;
		body.insertBefore(wrap, body.firstChild);
		
		var name, i = 0,
			DOM = {wrap: $(wrap)},
			els = wrap.getElementsByTagName('*'),
			elsLen = els.length;
			
		for (; i < elsLen; i ++) {
			name = els[i].className.split('aui_')[1];
			if (name) DOM[name] = $(els[i]);
		};
		
		return DOM;
	},
	
	// px与%单位转换成数值 (百分比单位按照最大值换算)
	// 其他的单位返回原值
	_toNumber: function (thisValue, maxValue) {
		if (!thisValue && thisValue !== 0 || typeof thisValue === 'number') {
			return thisValue;
		};
		
		var last = thisValue.length - 1;
		if (thisValue.lastIndexOf('px') === last) {
			thisValue = parseInt(thisValue);
		} else if (thisValue.lastIndexOf('%') === last) {
			thisValue = parseInt(maxValue * thisValue.split('%')[0] / 100);
		};
		
		return thisValue;
	},
	
	// 让IE6 CSS支持PNG背景
	_ie6PngFix: _isIE6 ? function () {
		var i = 0, elem, png, pngPath, runtimeStyle,
			path = artDialog.defaults.path + '/skin/',
			list = this.DOM.wrap[0].getElementsByTagName('*');
		
		for (; i < list.length; i ++) {
			elem = list[i];
			png = elem.currentStyle['png'];
			if (png) {
				pngPath = path + png;
				runtimeStyle = elem.runtimeStyle;
				runtimeStyle.backgroundImage = 'none';
				runtimeStyle.filter = "progid:DXImageTransform.Microsoft." +
					"AlphaImageLoader(src='" + pngPath + "',sizingMethod='crop')";
			};
		};
	} : $.noop,
	
	// 强制覆盖IE6下拉控件
	_ie6SelectFix: _isIE6 ? function () {
		var $wrap = this.DOM.wrap,
			wrap = $wrap[0],
			expando = _expando + 'iframeMask',
			iframe = $wrap[expando],
			width = wrap.offsetWidth,
			height = wrap.offsetHeight;

		width = width + 'px';
		height = height + 'px';
		if (iframe) {
			iframe.style.width = width;
			iframe.style.height = height;
		} else {
			iframe = wrap.appendChild(document.createElement('iframe'));
			$wrap[expando] = iframe;
			iframe.src = 'about:blank';
			iframe.style.cssText = 'position:absolute;z-index:-1;left:0;top:0;'
			+ 'filter:alpha(opacity=0);width:' + width + ';height:' + height;
		};
	} : $.noop,
	
	// 解析HTML片段中自定义类型脚本，其this指向artDialog内部
	_runScript: function (elem) {
		var fun, i = 0, n = 0,
			tags = elem.getElementsByTagName('script'),
			length = tags.length,
			script = [];
			
		for (; i < length; i ++) {
			if (tags[i].type === 'text/dialog') {
				script[n] = tags[i].innerHTML;
				n ++;
			};
		};
		
		if (script.length) {
			script = script.join('');
			fun = new Function(script);
			fun.call(this);
		};
	},
	
	// 自动切换定位类型
	_autoPositionType: function () {
		this[this.config.fixed ? '_setFixed' : '_setAbsolute']();/////////////
	},

	// 设置静止定位
	// IE6 Fixed @see: http://www.planeart.cn/?p=877
	_setFixed: (function () {
		_isIE6 && $(function () {
			var bg = 'backgroundAttachment';
			if (_$html.css(bg) !== 'fixed' && $('body').css(bg) !== 'fixed') {
				_$html.css({
					zoom: 1,// 避免偶尔出现body背景图片异常的情况
					backgroundImage: 'url(about:blank)',
					backgroundAttachment: 'fixed'
				});
			};
		});
		
		return function () {
			var $elem = this.DOM.wrap,
				style = $elem[0].style;
			
			if (_isIE6) {
				var left = parseInt($elem.css('left')),
					top = parseInt($elem.css('top')),
					sLeft = _$document.scrollLeft(),
					sTop = _$document.scrollTop(),
					txt = '(document.documentElement)';
				
				this._setAbsolute();
				style.setExpression('left', 'eval(' + txt + '.scrollLeft + '
					+ (left - sLeft) + ') + "px"');
				style.setExpression('top', 'eval(' + txt + '.scrollTop + '
					+ (top - sTop) + ') + "px"');
			} else {
				style.position = 'fixed';
			};
		};
	}()),
	
	// 设置绝对定位
	_setAbsolute: function () {
		var style = this.DOM.wrap[0].style;
			
		if (_isIE6) {
			style.removeExpression('left');
			style.removeExpression('top');
		};

		style.position = 'absolute';
	},
	
	// 按钮回调函数触发
	_click: function (name) {
		var that = this,
			fn = that._listeners[name] && that._listeners[name].callback;
		return typeof fn !== 'function' || fn.call(that, window) !== false ?
			that.close() : that;
	},
	
	// 重置位置与尺寸
	_reset: function (test) {
		var newSize,
			that = this,
			oldSize = that._winSize || _$window.width() * _$window.height(),
			elem = that._follow,
			width = that._width,
			height = that._height,
			left = that._left,
			top = that._top;
		
		if (test) {
			// IE6~7 window.onresize bug
			newSize = that._winSize =  _$window.width() * _$window.height();
			if (oldSize === newSize) return;
		};
		
		if (width || height) that.size(width, height);
		
		if (elem) {
			that.follow(elem);
		} else if (left || top) {
			that.position(left, top);
		};
	},

	// 事件代理
	_addEvent: function () {
	    var resizeTimer,
			that = this,
			config = that.config,
			isIE = 'CollectGarbage' in window,
			DOM = that.DOM;
 
	    // 窗口调节事件
	    that._winResize = function () {
	        resizeTimer && clearTimeout(resizeTimer);
	        resizeTimer = setTimeout(function () {
	            that._reset(isIE);
	        }, 40);
	    };
	    _$window.bind('resize', that._winResize);
 
	    // 监听点击
	    DOM.wrap
		.bind('click', function (event) {
		    var target = event.target, callbackID;
 
		    if (target.disabled) return false; // IE BUG
 
		    if (target === DOM.close[0]) {
		        that._click(config.cancelVal);
		        return false;
		    } else if (target === DOM.max[0]) {
		        that.max();
		    } else if (target === DOM.min[0]) {
		        that.min();
		    } else {
		        callbackID = target[_expando + 'callback'];
		        callbackID && that._click(callbackID);
		    };
 
		    that._ie6SelectFix();
		})
		.bind('mousedown', function () {
		    that.zIndex();
		});
	},

	// 卸载事件代理
	_removeEvent: function () {
		var that = this,
			DOM = that.DOM;
		
		DOM.wrap.unbind();
		_$window.unbind('resize', that._winResize);
	}
	
};

artDialog.fn._init.prototype = artDialog.fn;
$.fn.dialog = $.fn.artDialog = function () {
	var config = arguments;
	this[this.live ? 'live' : 'bind']('click', function () {
		artDialog.apply(this, config);
		return false;
	});
	return this;
};

/** 最顶层的对话框API */
artDialog.focus = null;

/** 获取某对话框API */
artDialog.get = function (id) {
	return id === undefined
	? artDialog.list
	: artDialog.list[id];
};

artDialog.list = {};

// 全局快捷键
_$document.bind('keydown', function (event) {
	var target = event.target,
		nodeName = target.nodeName,
		rinput = /^INPUT|TEXTAREA$/,
		api = artDialog.focus,
		keyCode = event.keyCode;

	if (!api || !api.config.esc || rinput.test(nodeName)) return;
		
	keyCode === 27 && api._click(api.config.cancelVal);
});

// 获取artDialog路径
_path = window['_artDialog_path'] || (function (script, i, me) {
	for (i in script) {
		// 如果通过第三方脚本加载器加载本文件，请保证文件名含有"artDialog"字符
		if (script[i].src && script[i].src.indexOf('artDialog') !== -1) me = script[i];
	};
	
	_thisScript = me || script[script.length - 1];
	me = _thisScript.src.replace(/\\/g, '/');
	return me.lastIndexOf('/') < 0 ? '.' : me.substring(0, me.lastIndexOf('/'));
}(document.getElementsByTagName('script')));

// 无阻塞载入CSS (如"artDialog.js?skin=aero")
_skin = _thisScript.src.split('skin=')[1];
if (_skin) {
	var link = document.createElement('link');
	link.rel = 'stylesheet';
	link.href = _path + '/skin/' + _skin + '.css?' + artDialog.fn.version;
	_thisScript.parentNode.insertBefore(link, _thisScript);
};

// 开启IE6 CSS背景图片缓存
try {
	document.execCommand('BackgroundImageCache', false, true);
} catch (e) {};

artDialog._templates =
'<div class="aui_outer">'
+	'<table class="aui_border">'
+		'<tbody>'
+			'<tr>'
+				'<td class="aui_nw"></td>'
+				'<td class="aui_n"></td>'
+				'<td class="aui_ne"></td>'
+			'</tr>'
+			'<tr>'
+				'<td class="aui_w"></td>'
+				'<td class="aui_c">'
+					'<div class="aui_inner">'
+					'<table class="aui_dialog">'
+						'<tbody>'
+							'<tr>'
+								'<td colspan="2" class="aui_header">'
+									'<div class="aui_titleBar">'
+										'<div class="aui_title"></div>'
+                                            '<a class="aui_min"></i></a>'
+                                            '<a class="aui_max" state="false"></a>'
+                                            '<a class="aui_close" onclick="javascript:/*artDialog*/;"></a>'
+									'</div>'
+								'</td>'
+							'</tr>'
+							'<tr>'
+								'<td class="aui_icon">'
+									'<div class="aui_iconBg"></div>'
+								'</td>'
+								'<td class="aui_main">'
+									'<div class="aui_content"></div>'
+								'</td>'
+							'</tr>'
+							'<tr>'
+								'<td colspan="2" class="aui_footer">'
+									'<div class="aui_buttons"></div>'
+								'</td>'
+							'</tr>'
+						'</tbody>'
+					'</table>'
+					'</div>'
+				'</td>'
+				'<td class="aui_e"></td>'
+			'</tr>'
+			'<tr>'
+				'<td class="aui_sw"></td>'
+				'<td class="aui_s"></td>'
+				'<td class="aui_se"></td>'
+			'</tr>'
+		'</tbody>'
+	'</table>'
+'</div>';

/**
 * 默认配置
 */
artDialog.defaults = {
	content: '<div class="aui_loading"><span></span></div>',// 消息内容
	title: '\u6d88\u606f',		// 标题. 默认'消息'
	ok: null,					// 确定按钮回调函数
	cancel: null,				// 取消按钮回调函数
	init: null,					// 对话框初始化后执行的函数
	close: null,				// 对话框关闭前执行的函数
	min: null,
    max: null,
	okVal: '\u786E\u5B9A',		// 确定按钮文本. 默认'确定'
	cancelVal: '\u53D6\u6D88',	// 取消按钮文本. 默认'取消'
	width: 'auto',				// 内容宽度
	height: 'auto',				// 内容高度
	minWidth: 96,				// 最小宽度限制
	minHeight: 32,				// 最小高度限制
	padding: '20px 25px',		// 内容与边界填充距离
	skin: '',					// 皮肤名(预留接口,尚未实现)
	icon: null,					// 消息图标名称
	time: null,					// 自动关闭时间
	esc: true,					// 是否支持Esc键关闭
	focus: true,				// 是否支持对话框按钮自动聚焦
	show: true,					// 初始化后是否显示对话框
	follow: null,				// 跟随某元素(即让对话框在元素附近弹出)
	path: _path,				// artDialog路径
	lock: true,					// 是否锁屏
	background: '#000',			// 遮罩颜色
	opacity: .3,				// 遮罩透明度
	duration: 100,				// 遮罩透明度渐变动画速度
	fixed: false,				// 是否静止定位
	left: '50%',				// X轴坐标
	top: '38.2%',				// Y轴坐标
	zIndex: 999999,				// 对话框叠加高度值(重要：此值不能超过浏览器最大限制)
	resize: true,				// 是否允许用户调节尺寸
	drag: true					// 是否允许用户拖动位置
	
};

window.artDialog = $.dialog = $.artDialog = artDialog;
}(this.art || this.jQuery && (this.art = jQuery), this));

//------------------------------------------------
// 对话框模块-拖拽支持（可选外置模块）
//------------------------------------------------
;(function ($) {

var _dragEvent, _use,
	_$window = $(window),
	_$document = $(document),
	_elem = document.documentElement,
	_isIE6 = !('minWidth' in _elem.style),
	_isLosecapture = 'onlosecapture' in _elem,
	_isSetCapture = 'setCapture' in _elem;

// 拖拽事件
artDialog.dragEvent = function () {
	var that = this,
		proxy = function (name) {
			var fn = that[name];
			that[name] = function () {
				return fn.apply(that, arguments);
			};
		};
		
	proxy('start');
	proxy('move');
	proxy('end');
};

artDialog.dragEvent.prototype = {

	// 开始拖拽
	onstart: $.noop,
	start: function (event) {
		_$document
		.bind('mousemove', this.move)
		.bind('mouseup', this.end);
			
		this._sClientX = event.clientX;
		this._sClientY = event.clientY;
		this.onstart(event.clientX, event.clientY);

		return false;
	},
	
	// 正在拖拽
	onmove: $.noop,
	move: function (event) {		
		this._mClientX = event.clientX;
		this._mClientY = event.clientY;
		this.onmove(
			event.clientX - this._sClientX,
			event.clientY - this._sClientY
		);
		
		return false;
	},
	
	// 结束拖拽
	onend: $.noop,
	end: function (event) {
		_$document
		.unbind('mousemove', this.move)
		.unbind('mouseup', this.end);
		
		this.onend(event.clientX, event.clientY);
		return false;
	}
	
};

_use = function (event) {
	var limit, startWidth, startHeight, startLeft, startTop, isResize,
		api = artDialog.focus,
		//config = api.config,
		DOM = api.DOM,
		wrap = DOM.wrap,
		title = DOM.title,
		main = DOM.main;

	// 清除文本选择
	var clsSelect = 'getSelection' in window ? function () {
		window.getSelection().removeAllRanges();
	} : function () {
		try {
			document.selection.empty();
		} catch (e) {};
	};
	
	// 对话框准备拖动
	_dragEvent.onstart = function (x, y) {
		if (isResize) {
			startWidth = main[0].offsetWidth;
			startHeight = main[0].offsetHeight;
		} else {
			startLeft = wrap[0].offsetLeft;
			startTop = wrap[0].offsetTop;
		};
		
		_$document.bind('dblclick', _dragEvent.end);
		!_isIE6 && _isLosecapture ?
			title.bind('losecapture', _dragEvent.end) :
			_$window.bind('blur', _dragEvent.end);
		_isSetCapture && title[0].setCapture();
		
		wrap.addClass('aui_state_drag');
		api.focus();
	};
	
	// 对话框拖动进行中
	_dragEvent.onmove = function (x, y) {
		if (isResize) {
			var wrapStyle = wrap[0].style,
				style = main[0].style,
				width = x + startWidth,
				height = y + startHeight;
			
			wrapStyle.width = 'auto';
			style.width = Math.max(0, width) + 'px';
			wrapStyle.width = wrap[0].offsetWidth + 'px';
			
			style.height = Math.max(0, height) + 'px';
			
		} else {
			var style = wrap[0].style,
				left = Math.max(limit.minX, Math.min(limit.maxX, x + startLeft)),
				top = Math.max(limit.minY, Math.min(limit.maxY, y + startTop));

			style.left = left  + 'px';
			style.top = top + 'px';
		};
			
		clsSelect();
		api._ie6SelectFix();
	};
	
	// 对话框拖动结束
	_dragEvent.onend = function (x, y) {
		_$document.unbind('dblclick', _dragEvent.end);
		!_isIE6 && _isLosecapture ?
			title.unbind('losecapture', _dragEvent.end) :
			_$window.unbind('blur', _dragEvent.end);
		_isSetCapture && title[0].releaseCapture();
		
		_isIE6 && !api.closed && api._autoPositionType();
		
		wrap.removeClass('aui_state_drag');
	};
	
	isResize = event.target === DOM.se[0] ? true : false;
	limit = (function () {
		var maxX, maxY,
			wrap = api.DOM.wrap[0],
			fixed = wrap.style.position === 'fixed',
			ow = wrap.offsetWidth,
			oh = wrap.offsetHeight,
			ww = _$window.width(),
			wh = _$window.height(),
			dl = fixed ? 0 : _$document.scrollLeft(),
			dt = fixed ? 0 : _$document.scrollTop(),
			
		// 坐标最大值限制
		maxX = ww - ow + dl;
		maxY = wh - oh + dt;
		
		return {
			minX: dl,
			minY: dt,
			maxX: maxX,
			maxY: maxY
		};
	})();
	
	_dragEvent.start(event);
};

// 代理 mousedown 事件触发对话框拖动
_$document.bind('mousedown', function (event) {
	var api = artDialog.focus;
	if (!api) return;

	var target = event.target,
		config = api.config,
		DOM = api.DOM;
	
	if (config.drag !== false && target === DOM.title[0]
	|| config.resize !== false && target === DOM.se[0]) {
		_dragEvent = _dragEvent || new artDialog.dragEvent();
		_use(event);
		return false;// 防止firefox与chrome滚屏
	};
});

})(this.art || this.jQuery && (this.art = jQuery));

//iframetools.js
(function(E, C, D, A) {
	var B, $, _, J = "@ARTDIALOG.data",
		K = "@ARTDIALOG.OPEN ",
		H = "@ARTDIALOG.OPENER",
		I = C.name = C.name || "@ARTDIALOG.WINNAME" + (new Date).getTime(),
		F = C.VBArray && !C.XMLHttpRequest;
	E(function() {
		!C.jQuery && document.compatMode === "BackCompat" && alert("artDialog Error: document.compatMode === \"BackCompat\"")
	});
	var G = D.top = function() {
			var _ = C,
				$ = function(A) {
					try {
						var _ = C[A].document;
						_.getElementsByTagName
					} catch ($) {
						return !1
					}
					return C[A].artDialog && _.getElementsByTagName("frameset").length === 0
				};
			return $("top") ? _ = C.top : $("parent") && (_ = C.parent), _
		}();
	D.parent = G, B = G.artDialog, _ = function() {
		return B.defaults.zIndex
	}, D.data = function(C, B) {
		var _ = D.top,
			$ = _[J] || {};
		_[J] = $;
		if (B !== A) $[C] = B;
		else return $[C];
		return $
	}, D.removedata = function(_) {
		var $ = D.top[J];
		$ && $[_] && delete $[_]
	}, D.through = $ = function() {
		var $ = B.apply(this, arguments);
		return G !== C && (D.list[$.config.id] = $), $
	}, G !== C && E(C).bind("unload", function() {
		var A = D.list,
			_;
		for (var $ in A) A[$] && (_ = A[$].config, _ && (_.duration = 0), A[$].close(), delete A[$])
	}), D.open = function(B, P, O) {
		P = P || {};
		var N, L, M, X, W, V, U, T, S, R = D.top,
			Q = "position:absolute;left:-9999em;top:-9999em;border:none 0;background:transparent",
			a = "width:100%;height:100%;border:none 0";
		if (O === !1) {
			var Z = (new Date).getTime(),
				Y = B.replace(/([?&])_=[^&]*/, "$1_=" + Z);
			B = Y + (Y === B ? (/\?/.test(B) ? "&" : "?") + "_=" + Z : "")
		}
		var G = function() {
				var B, C, _ = L.content.find(".aui_loading"),
					A = N.config;
				//M.addClass("aui_state_full"), _ && _.hide();
				M.addClass("aui_state_full");
				try {
					T = W.contentWindow, U = E(T.document), S = T.document.body
				} catch ($) {
					W.style.cssText = a, A.follow ? N.follow(A.follow) : N.position(A.left, A.top), P.init && P.init.call(N, T, R), P.init = null;
					return
				}
				B = A.width === "auto" ? U.width() + (F ? 0 : parseInt(E(S).css("marginLeft"))) : A.width, C = A.height === "auto" ? U.height() : A.height, setTimeout(function() {
					W.style.cssText = a
				}, 0), P.init && P.init.call(N, T, R), P.init = null
			},
			I = {
				zIndex: _(),
				init: function() {
					N = this, L = N.DOM, X = L.main, M = L.content, W = N.iframe = R.document.createElement("iframe"), W.src = B, W.name = "Open" + N.config.id, W.style.cssText = Q, W.setAttribute("frameborder", 0, 0), W.setAttribute("allowTransparency", !0), W.setAttribute("scrolling", "auto"), V = E(W), N.content().appendChild(W), T = W.contentWindow;
					try {
						T.name = W.name, D.data(W.name + K, N), D.data(W.name + H, C)
					} catch ($) {}
					G();
					W.onload = function(){
						L.content.find(".aui_loading").remove()
					}
				},
				close: function() {
					if (P.close && P.close.call(this, W.contentWindow, R) === !1) return !1;
					M.removeClass("aui_state_full"), V[0].src = "about:blank", V.remove();
					try {
						D.removedata(W.name + K), D.removedata(W.name + H)
					} catch ($) {}
				}
			};
		typeof P.ok == "function" && (I.ok = function() {
			return P.ok.call(N, W.contentWindow, R)
		}), typeof P.cancel == "function" && (I.cancel = function() {
			return P.cancel.call(N, W.contentWindow, R)
		}), delete P.content;
		for (var J in P) I[J] === A && (I[J] = P[J]);
		return $(I)
	}, D.open.api = D.data(I + K), D.opener = D.data(I + H) || C, D.open.origin = D.opener, D.close = function() {
		var $ = D.data(I + K);
		return $ && $.close(), !1
	}, G != C && E(document).bind("mousedown", function() {
		var $ = D.open.api;
		$ && $.zIndex()
	}), D.load = function(C, D, B) {
		B = B || !1;
		var G = D || {},
			H = {
				zIndex: _(),
				init: function(A) {
					var _ = this,
						$ = _.config;
					E.ajax({
						url: C,
						success: function($) {
							_.content($), G.init && G.init.call(_, A)
						},
						cache: B
					})
				}
			};
		delete D.content;
		for (var F in G) H[F] === A && (H[F] = G[F]);
		return $(H)
	}, D.alert = function(B, A) {
		return $({
			id: "Alert",
			zIndex: _(),
			icon: "warning",
			fixed: !0,
			lock: !0,
			content: B,
			ok: !0,
			close: A
		})
	}, D.confirm = function(C, A, B) {
		return $({
			id: "Confirm",
			zIndex: _(),
			icon: "question",
			fixed: !0,
			lock: !0,
			opacity: 0.1,
			content: C,
			ok: function($) {
				return A.call(this, $)
			},
			cancel: function($) {
				return B && B.call(this, $)
			}
		})
	}, D.prompt = function(D, B, C) {
		C = C || "";
		var A;
		return $({
			id: "Prompt",
			zIndex: _(),
			icon: "question",
			fixed: !0,
			lock: !0,
			opacity: 0.1,
			content: ["<div style=\"margin-bottom:5px;font-size:12px\">", D, "</div>", "<div>", "<input value=\"", C, "\" style=\"width:18em;padding:6px 4px\" />", "</div>"].join(""),
			init: function() {
				A = this.DOM.content.find("input")[0], A.select(), A.focus()
			},
			ok: function($) {
				return B && B.call(this, A.value, $)
			},
			cancel: !0
		})
	}, D.tips = function(B, A) {
		return $({
			id: "Tips",
			zIndex: _(),
			title: !1,
			cancel: !1,
			fixed: !0,
			lock: !1
		}).content("<div style=\"padding: 0 1em;\">" + B + "</div>").time(A || 1.5)
	}, E(function() {
		var A = D.dragEvent;
		if (!A) return;
		var B = E(C),
			$ = E(document),
			_ = F ? "absolute" : "fixed",
			H = A.prototype,
			I = document.createElement("div"),
			G = I.style;
		G.cssText = "display:none;position:" + _ + ";left:0;top:0;width:100%;height:100%;" + "cursor:move;filter:alpha(opacity=0);opacity:0;background:#FFF", document.body.appendChild(I), H._start = H.start, H._end = H.end, H.start = function() {
			var E = D.focus.DOM,
				C = E.main[0],
				A = E.content[0].getElementsByTagName("iframe")[0];
			H._start.apply(this, arguments), G.display = "block", G.zIndex = D.defaults.zIndex + 3, _ === "absolute" && (G.width = B.width() + "px", G.height = B.height() + "px", G.left = $.scrollLeft() + "px", G.top = $.scrollTop() + "px"), A && C.offsetWidth * C.offsetHeight > 307200 && (C.style.visibility = "")
		}, H.end = function() {
			var $ = D.focus;
			H._end.apply(this, arguments), G.display = "none", $ && ($.DOM.main[0].style.visibility = "visible")
		}
	})
})(this.art || this.jQuery, this, this.artDialog)