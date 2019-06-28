var exec = require('cordova/exec');

var mwnavbar = {
    setOptions: function(data) {
        exec(null, null, 'mwnavbar', 'setOptions', [data]);
    },
    setTitle: function(data) {
        exec(null, null, 'mwnavbar', 'setTitle', [data]);
    },
    setupLeftButton: function(data) {
        exec(null, null, 'mwnavbar', 'setupLeftButton', [data]);
    },
    setupRightButton: function(data) {
        exec(null, null, 'mwnavbar', 'setupRightButton', [data]);
    },
    showRightButton: function(data) {
        exec(null, null, 'mwnavbar', 'showRightButton', [data]);
    },
    showLeftButton: function(data) {
        exec(null, null, 'mwnavbar', 'showLeftButton', [data]);
    },
    hideRightButton: function(data) {
        exec(null, null, 'mwnavbar', 'hideRightButton', [data]);
    },
    hideLeftButton: function(data) {
        exec(null, null, 'mwnavbar', 'hideLeftButton', [data]);
    },
    loadUrl: function(data, readAccessPath) {
        exec(null, null, 'mwnavbar', 'loadUrl', [data, readAccessPath]);
    }
};

module.exports = mwnavbar;
