function logActiveTab() {
    chrome.tabs.query({ active: true, currentWindow: true }, function (tabs) {
        if (tabs.length > 0) {
            console.log("Current Tab URL:", tabs[0].url);
            return tabs[0].url
        }
    });
}

chrome.tabs.onActivated.addListener(logActiveTab);