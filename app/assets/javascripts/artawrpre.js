var inners = document.getElementsByClassName("inner");
var maxHeight = 0;
for (var i = 0; i < inners.length; i++) {
    if (inners[i].offsetHeight > maxHeight)
        maxHeight = inners[i].offsetHeight;
}
for (var i = 0; i < inners.length; i++)
    inners[i].style.height = maxHeight + 'px';