```javascript
var issues = document.getElementsByClassName("opened-by")
var output = ""
for(i=0; i < issues.length; i++) { 
    output += " " + issues[i].innerText.substring(0,4);
}
```
