$(window).on("load",
             () => {
                 var img = new Image();
                 img.src = location.pathname + "/data";
                 $(img).on("load", () => {
                     var canvas = document.getElementById("canvas");
                     canvas.width = img.width;
                     canvas.height = img.height;
                     var ctx = canvas.getContext("2d");
                     ctx.drawImage(img,0,0);
                     ReactDOM.render(
                         <WordList />,
                         document.getElementById("word-list")
                     );
                 });
             });
