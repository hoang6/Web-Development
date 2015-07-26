$.Tabs = function (el) {
  this.$el = $(el);
  this.$contentTabs = $(this.$el.data("content-tabs"));
  this.$activeTab = this.$contentTabs.find(".active");

  this.$el.on("click", "a", this.clickTab.bind(this));
};

$.Tabs.prototype.clickTab = function (event) {
  event.preventDefault();

  // if (this.transitioning) {
  //   return;
  // }
  // this.transitioning = true;

  // Switch active link, ok this is correct so far
  this.$el.find("a").removeClass("active");
  var activeLink = $(event.currentTarget);
  activeLink.addClass("active");

  // Switch active pane
  // var activePane = this.contentTabs.find(activeLink.data);
  var newActiveSel = $(event.currentTarget).attr("for");
  var $newActiveTab = this.$contentTabs.find(newActiveSel);

  // $newActiveTab.addClass("active");
  // this.$activeTab = $newActiveTab;

  this.$activeTab.removeClass("active").addClass("transitioning");
  this.$activeTab.one("transitionend", (function() {
    this.$activeTab.removeClass("transitioning");

    this.$activeTab = $newActiveTab;
    this.$activeTab.addClass("transitioning");
    setTimeout((function() {
      this.$activeTab.removeClass("transitioning").addClass("active");
      // this.transitioning = false;
    }).bind(this), 0);
  }).bind(this));

};

$.fn.tabs = function () {
  return this.each(function () {
    new $.Tabs(this);
  });
};
