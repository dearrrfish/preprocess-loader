(function () {
    "use strict";
    var a, b, c, d;
    a = require("lodash"), c = require("path"), d = require("preprocess"), b = require("loader-utils"), module.exports = function (e) {
        var f, g, h, i, j, k;
        return "function" == typeof this.cacheable && this.cacheable(), k = c.extname(this.resourcePath || "").split("."), g = k[k.length - 1], h = {
            srcDir: this.context,
            type: g
        }, j = b.getOptions(this), a.isObject(j.ppOptions) && (h = a.merge(h, j.ppOptions), delete j.ppOptions), /cjsx/i.test(h.type) && (h.type = "coffee"), f = a.merge({}, process.env, j), f.NODE_ENV = f.NODE_ENV || "development", i = d.preprocess(e, f, h), this.callback(null, i)
    }
}).call(this);
