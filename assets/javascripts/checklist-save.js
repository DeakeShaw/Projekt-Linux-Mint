document$.subscribe(function () {
  var pageKey = "checklist:" + window.location.pathname;

  var checkboxes = document.querySelectorAll(
    ".task-list-control input[type='checkbox'], .md-typeset input[type='checkbox']"
  );

  if (checkboxes.length === 0) return;

  var saved = {};
  try {
    saved = JSON.parse(localStorage.getItem(pageKey)) || {};
  } catch (e) {
    saved = {};
  }

  checkboxes.forEach(function (box, index) {
    var id = "box-" + index;

    if (saved[id]) {
      box.checked = true;
    }

    box.addEventListener("change", function () {
      saved[id] = box.checked;
      localStorage.setItem(pageKey, JSON.stringify(saved));
    });
  });
});