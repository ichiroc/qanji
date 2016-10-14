import $ from 'jquery';
import React from 'react';
import ReactDOM from 'react-dom';
import WordList from './components/word-list.jsx';

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
