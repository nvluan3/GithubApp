(function() {

    String.prototype.print_f = function() {

        var formatted = this;
        for (var i = 0; i < arguments.length; i++) {

            var regexp = new RegExp('\\{' + i + '\\}', 'gi');
            formatted = formatted.replace(regexp, arguments[i]);

        }

        return formatted;

    };

    function second2minute(second) {

        second = parseInt(second);
        var minute = parseInt(second / 60);
        var second = second % 60;

        if (minute < 10) {
            minute = "0" + minute;
        }
        minute += "";

        if (second < 10) {
            second = "0" + second;
        }
        second += "";

        return minute + ":" + second;

    }

    function messageTimeFormat(time) {

        time *= 1000;

        var mdate = new Date(time);

        var hours = mdate.getHours();
        if (hours < 10) {
            hours = "0" + hours;
        }
        hours += "";

        var minutes = mdate.getMinutes();
        if (minutes < 10) {
            minutes = "0" + minutes;
        }
        minutes += "";

        if (mdate.toDateString() === new Date().toDateString()) {

            return hours + ":" + minutes;

        } else if (mdate.toDateString() === new Date(Date.now() - 1000 * 60 * 60 * 24).toDateString()) {

            return "Yesterday " + hours + ":" + minutes;

        } else if (Date.now() - mdate.getTime() < 1000 * 60 * 60 * 24 * 7) {

            return ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"][mdate.getDay()] + " " + hours + ":" + minutes;

        } else {

            return [(mdate.getMonth() + 1), mdate.getDate(), mdate.getFullYear()].join("/") + " " + hours + ":" + minutes;

        }

    }

    var content = $("#content");
    var loader = $("#loader");

    var MESSAGER_TYPE = {

        "SMS": "sms",

    };

    var FTYPE = {

        "PRIVATE": "private",
        "GROUP": "group",

    }

    var MESSAGE_TYPE = {

        "TEXT": "text",
        "IMAGE": "image",
        "AUDIO": "audio",
        "VIDEO": "video",
        "APP": "appmsg",

    };

    var PASSIVE_EVENT_TYPE = {

        "LOGIN": "login",
        "MESSAGETABLE": "messageTable",

    };

    var INITIATIVE_EVENT_TYPE = {

        "PLAYVIDEO": "playVideo",
        "PLAYAUDIO": "playAudio",
        "VIEWIMAGE": "viewImage",
        "OPENWEB": "openWeb",
        "MESSAGETABLE": "messageTable",
        "COPY": "copy",

    };

    var TEMPLATE = {

        "MESSAGE_TEXT": '<div class="message" data-mid="{0}">' +
            '<div class="face"><img src="{1}" /></div>' +
            '<div class="name">{2}</div>' +
            '<div class="msg text"><a href="javascript:;" class="btn btn-copy">Copy</a>{3}</div>' +
            '</div>',

        "MESSAGE_IMAGE": '<div class="message" data-mid="{0}">' +
            '<div class="face"><img src="{1}" /></div>' +
            '<div class="name">{2}</div>' +
            '<div class="msg image"><img src="{3}" /></div>' +
            '</div>',

        "MESSAGE_AUDIO": '<div class="message" data-mid="{0}">' +
            '<div class="face"><img src="{1}" /></div>' +
            '<div class="name">{2}</div>' +
            '<div class="msg audio" style="width:{4}px;"><i class="icon icon-audio"></i><span class="longtime">{3}"</span></div>' +
            '</div>',

        "MESSAGE_VIDEO": '<div class="message" data-mid="{0}">' +
            '<div class="face"><img src="{1}" /></div>' +
            '<div class="name">{2}</div>' +
            '<div class="msg video"><i class="icon icon-video"></i><span class="longtime">{3}</span><img src="{4}" /></div>' +
            '</div>',

        "MESSAGE_APP": '<div class="message" data-mid="{0}">' +
            '<div class="face"><img src="{1}" /></div>' +
            '<div class="name">{2}</div>' +
            '<div class="msg text app"><span class="link" data-url="{4}">{3}</span></div>' +
            '</div>',

        "TIME": '<div class="time"><p><span>{0}</span></p></div>',
    };

    var messager = {

        "type": null,

        "uid": null,
        "fid": null,
        "ftype": FTYPE.PRIVATE,
        "lastTime": Date.now() / 1000,
        "total": 0,
        "page": 0,
        "messages": [],

        "loading": false,
        "loadingTime": 0,
        "loadingTimer": null,

        "bottom": 0,

        "appendMessages": function(messages) {

            for (var i = 0; i < messages.length; ++i) {
                messager.appendMessage(messages[i]);
            }

            this.messages.length < this.total ? loader.show() : loader.hide();

            setTimeout(function() {

                DDebug.log([messager.messages.length, messager.total, content.height(), $(window).height()].join("/"));

                if (messager.messages.length < messager.total && content.height() <= $(window).height()) {

                    viewMoreMessage();

                }

            }, 100);

            msgScroll.resize();

        },

        "appendMessage": function(message) {

            message.mid = Date.now() + "-" + Math.random();

            if (this.messages.length == 0 || (message.time < messager.lastTime && messager.lastTime - message.time > 600)) {

                messager.lastTime = message.time;

                content.find("#loader").after(TEMPLATE.TIME.print_f(messageTimeFormat(message.time)));

            }

            this.messages.push(message);

            var messageHtml = '';

            var uname = message.uname;
            uname = jEmoji.unifiedToHTML(uname);

            switch (message.type) {
                case MESSAGE_TYPE.TEXT:

                    var msgText = message.content;

                    msgText = msgText.replace(/[<]/g, "&lt;");
                    msgText = msgText.replace(/[>]/g, "&gt;");

                    msgText = jEmoji.unifiedToHTML(msgText);

                    msgText = msgText.replace(
                        /(((https?:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)(:[0-9]+)?((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/g,
                        '<span class="link" data-url="$1">$1</span>'
                    );

                    messageHtml = TEMPLATE.MESSAGE_TEXT.print_f(message.mid, message.uface || "images/defaultFace.png", uname, msgText);

                    break;
                case MESSAGE_TYPE.IMAGE:

                    messageHtml = TEMPLATE.MESSAGE_IMAGE.print_f(message.mid, message.uface || "images/defaultFace.png", uname, message.src);

                    break;
                case MESSAGE_TYPE.AUDIO:

                    var second = Math.min(60, parseInt(message.longtime));
                    var w = 280 / 60 * second;

                    messageHtml = TEMPLATE.MESSAGE_AUDIO.print_f(message.mid, message.uface || "images/defaultFace.png", uname, message.longtime, w);

                    break;
                case MESSAGE_TYPE.VIDEO:

                    messageHtml = TEMPLATE.MESSAGE_VIDEO.print_f(message.mid, message.uface || "images/defaultFace.png", uname, second2minute(message.longtime), message.src);

                    break;

                case MESSAGE_TYPE.APP:

                    messageHtml = TEMPLATE.MESSAGE_APP.print_f(message.mid, message.uface || "images/defaultFace.png", uname, message.title || "", message.url);

                    break;
            }

            $messageHtml = $(messageHtml);
            if (message.uid == messager.uid) {
                $messageHtml.addClass("self");
            }


            content.find(".time").eq(0).after($messageHtml);

        },

    };

    var msgScroll = (function(messager, content) {

        this.dom = $("#msgScroll");
        this.mouseStart = null;
        this.bottom = 0;

        this.scroll = function(e) {

            if (this.mouseStart && e) {

                if (e.clientY == this.mouseStart.clientY) {
                    return;
                }

                var b = (this.bottom - (e.clientY - this.mouseStart.clientY)) / ($(window).height() - this.dom.height()) * (-content.height() + $(window).height());

                this.mouseStart = e;

                messagerScrollTo(b);

            } else {

                this.bottom = content.height() == $(window).height() ? 0 : ($(window).height() - this.dom.height()) * Math.abs(parseInt(content.css("bottom")) / (-content.height() + $(window).height()));
                this.dom.css("bottom", this.bottom + "px");

            }

        };

        this.resize = function() {

            setTimeout(function() {

                if (content.height() <= $(window).height()) {

                    this.dom.hide();

                } else {

                    var h = $(window).height() - (content.height() - $(window).height());
                    this.dom.css("height", h + "px");
                    this.dom.show();

                }

            }, 100);
        };

        return this;

    })(messager, content);


    init();

    function init() {

		DDebug.init();
        initEvent();

        sendMessage("ready");

    }

    function initEvent() {

        window.onmousewheel = function(e) {

            var t = e.wheelDelta || e.detail;
            var p = t > 0 ? -75 : 75;

            messagerScrollTo(messager.bottom + p);

        };

        window.onresize = function(e) {

            messager.resizeTimer && clearTimeout(messager.resizeTimer);
            messager.resizeTimer = setTimeout(function() {

                messagerScrollTo(messager.bottom);
                msgScroll.resize();

            }, 100);

        };

        window.onmousedown = function(e) {

            if (e.target.id == "msgScroll") {
                msgScroll.mouseStart = e;
            }

        };

        window.onmousemove = function(e) {

            if (msgScroll.mouseStart) {
                msgScroll.scroll(e);
            }

        };

        window.onmouseup = function(e) {

            if (msgScroll.mouseStart) {
                msgScroll.mouseStart = null;
            }

        };

        content.on("click", "#loader", function(e) {

            viewMoreMessage();

        });

        content.on("click", ".msg.video", function(e) {

            var mid = $(this).parents(".message").attr("data-mid");
            var msgObj = findMessage(mid);
            sendMessage(INITIATIVE_EVENT_TYPE.PLAYVIDEO, {

                "locpath": msgObj && msgObj.locpath || "",

            });

        });

        content.on("click", ".msg.audio", function(e) {

            var mid = $(this).parents(".message").attr("data-mid");
            var msgObj = findMessage(mid);
            sendMessage(INITIATIVE_EVENT_TYPE.PLAYAUDIO, {

                "locpath": msgObj && msgObj.locpath || "",

            });

        });

        content.on("click", ".msg.image", function(e) {

            var mid = $(this).parents(".message").attr("data-mid");
            var msgObj = findMessage(mid);
            sendMessage(INITIATIVE_EVENT_TYPE.VIEWIMAGE, {

                "locpath": msgObj && msgObj.locpath || "",

            });

        });

        content.on("click", ".msg .link", function(e) {

            sendMessage(INITIATIVE_EVENT_TYPE.OPENWEB, {

                "url": $(this).attr("data-url"),

            });

        });

        content.on("click", ".msg .btn-copy", function(e) {

            var mid = $(this).parents(".message").attr("data-mid");
            var msgObj = findMessage(mid);
            sendMessage(INITIATIVE_EVENT_TYPE.COPY, {

                "text": msgObj && msgObj.content || "",

            });

        });

    }

    function receiveMessage(msg) {

        DDebug.log("receiveMessage: " + msg);

        try {

            if(!msg) {
                hint("receiveMessage Error");
                return;
            }

            var message = typeof msg == "object" ? msg : JSON.parse(msg);
            console.log(JSON.stringify(message));

            switch (message.event) {

                case PASSIVE_EVENT_TYPE.LOGIN:

                    DDebug.log("logged in: " + message.data.uid);

                    messager.uid = message.data.uid;
                    setMessagerType(message.data.type);

                    break;
                case PASSIVE_EVENT_TYPE.MESSAGETABLE:

                    resetLoading(false);
                    clearTimeout(messager.loadingTimer);

                    if (message.data.loadingTime == 0 || message.data.loadingTime == messager.loadingTime) {

                        messager.loadingTime = 0;

                        if (messager.fid != message.data.fid) {

                            DDebug.log("New FID: " + message.data.fid);

                            messager.messages = [];
                            messager.fid = message.data.fid;
                            messager.ftype = message.data.ftype;
                            messager.total = message.data.total;
                            messager.page = 1;
                            messager.lastTime = Date.now() / 1000;

                            content.find(".message,.time").remove();

                            messagerScrollTo(0);

                            switch (messager.ftype) {

                                case FTYPE.GROUP:

                                    content.attr("class", "group");

                                    break;
                                case FTYPE.PRIVATE:

                                    content.attr("class", "private");

                                    break;

                            }

                        } else {

                            messager.page++;

                        }

                        message.data.messages.sort(function(v1, v2) {
                            return v2.time - v1.time;
                        });

                        messager.appendMessages(message.data.messages);

                    } else {

                        DDebug.log("loadingTime inconformity");

                    }

                    break;
                default:

                    DDebug.log("receiveMessage: Undefined Event");

                    break;

            }

        } catch (e) {

            hint(e || "Unknown Error");

        }

        return 0;

    }

    function sendMessage(event, data) {

        var jsonStr = JSON.stringify({

            "event": event,
            "data": data,

        });

        DDebug.log("sendMessage: " + jsonStr);
        console.log(jsonStr);
        window.uClient && window.uClient.sendMessage(jsonStr);

    }

    function viewMoreMessage() {

        DDebug.log([messager.loading, messager.messages.length, messager.total].join("/"));
        if (!messager.loading && messager.messages.length < messager.total) {

            resetLoading(true);
            messager.loadingTime = Date.now();

            messager.loadingTimer = setTimeout(function() {

                resetLoading(false);
                messager.loadingTime = 0;
                hint("Timeout when loading more information.");

            }, 3000);

            sendMessage(INITIATIVE_EVENT_TYPE.MESSAGETABLE, {

                "fid": messager.fid,
                "page": messager.page + 1,
                "loadingTime": messager.loadingTime,

            });

        }

    }


    function findMessage(mid) {

        for (var i = 0; i < messager.messages.length; ++i) {

            if (messager.messages[i].mid == mid) {

                return messager.messages[i];

            }

        }

        return null;

    }

    function hint(str) {

        $("#hint").html("<p><span>" + str + "</span></p>").show();
        setTimeout(function() {

            $("#hint").hide();

        }, 3000);

    }
	
    function resetLoading(isLoading) {

        messager.loading = isLoading;
        if (loader.css("display") == "block") {

            loader.html(messager.loading ? '<img src="images/puff.svg" />' : "View more");

        }

    }

    function messagerScrollTo(bottom) {

        var maxScroll = -content.height() + $(window).height();

        bottom = Math.min(Math.max(maxScroll, bottom), 0);
        messager.bottom = bottom;
        content.css("bottom", messager.bottom + "px");

        msgScroll.scroll();

        if (messager.messages.length > 0 && bottom == maxScroll) {

            viewMoreMessage();

            return;

        }

    }

    function setMessagerType(mt) {

        messager.type = mt || MESSAGER_TYPE.SMS;
        content.addClass("mt_" + messager.type);

    }

    window.pcMessager = {

        "receiveMessage": receiveMessage,

    };

})();