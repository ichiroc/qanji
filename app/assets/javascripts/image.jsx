$(window).on("load",
             () => {
                 var img = new Image();
                 img.src = location.pathname + "/data";
                 $(img).on("load", () => {
                     var ctx = document.getElementById("canvas").getContext("2d");
                     ctx.drawImage(img,0,0);
                     ReactDOM.render(
                         <WordList />,
                         document.getElementById("word-list")
                     );
                 });
             });
