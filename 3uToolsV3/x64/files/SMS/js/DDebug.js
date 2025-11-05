;
(function(name, definition) {

    // this is considered "safe":
    var hasDefine = typeof define === 'function';
    var hasExports = typeof module !== 'undefined' && module.exports;

    if (hasDefine) {
        // AMD Module or CMD Module
        define(definition);
    } else if (hasExports) {
        // Node.js Module
        module.exports = definition();
    } else {
        // Assign to common namespaces or simply the global object (window)
        this[name] = definition();
    }
})('DDebug', function() {

    var DDebug = {
        version: "0.0.1",
        position: {
            x: 0,
            y: 0
        }
    };

    DDebug.init = function() {

        this.isMobile = /Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent);

        this.dom = document.createElement("div");
        this.dom.id = "DDEBUG";

        this.dom.style.width = "50%";
        this.dom.style.height = "30%";
        this.dom.style.backgroundColor = "rgba(0, 0, 0, 0.7)";
        this.dom.style.fontSize = "12px";
        this.dom.style.color = "#FD0";
        this.dom.style.padding = "10px 20px";
        this.dom.style.position = "fixed";
        this.dom.style.zIndex = "99999";
        this.dom.style.overflow = "hidden";
        this.dom.style.wordBreak = "break-all";
        this.dom.style.borderRadius = "6px";
        this.dom.style.display = "none";
        this._updatePosition(0, 0);

        if (this.isMobile) { // 移动端

            this.dom.addEventListener("touchstart", this._mouseDown.bind(this));
            this.dom.addEventListener("touchmove", this._mouseMove.bind(this));
            this.dom.addEventListener("touchend", this._mouseUp.bind(this));

        } else { // PC端

            this.dom.addEventListener("mousedown", this._mouseDown.bind(this));
            this.dom.addEventListener("mousemove", this._mouseMove.bind(this));
            this.dom.addEventListener("mouseup", this._mouseUp.bind(this));

        }

        document.body.appendChild(this.dom);

        this.log("DDebug version: " + this.version);
    };

    DDebug._mouseDown = function(e) {

        this.mouseEvent = e;

    };

    DDebug._mouseMove = function(e) {

        if (this.mouseEvent) {

            var x, y;
            if (this.isMobile) {

                x = this.position.x + (e.touches[0].clientX - this.mouseEvent.touches[0].clientX);
                y = this.position.y + (e.touches[0].clientY - this.mouseEvent.touches[0].clientY);

            } else {

                x = this.position.x + (e.clientX - this.mouseEvent.clientX);
                y = this.position.y + (e.clientY - this.mouseEvent.clientY);

            }

            this._updatePosition(x, y);
            this.mouseEvent = e;

        }

    };

    DDebug._mouseUp = function(e) {

        this.mouseEvent = null;

    };

    DDebug._updatePosition = function(x, y) {

        this.position.x = x;
        this.position.y = y;

        this.dom.style.left = this.position.x + "px";
        this.dom.style.top = this.position.y + "px";

    };

    DDebug.log = function(str) {

        if (!this.dom) {
            return;
        }

        var date = new Date();
        var time = [date.getHours(), date.getMinutes(), date.getSeconds()].join(":") + "." + date.getMilliseconds();
        var p = document.createElement("p");
        p.innerHTML = "<span>#" + time + "#</span> " + str;

        this.dom.children.length > 0 ? this.dom.insertBefore(p, this.dom.childNodes[0]) : this.dom.appendChild(p);

    };

    return DDebug;

});