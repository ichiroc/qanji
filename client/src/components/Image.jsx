import $ from 'jquery';
import React from 'react';
import ReactDOM from 'react-dom';
import WordRegion from '../components/WordRegion.jsx';


export default class Image extends React.Component{
    componentWillReceiveProps(nextProps){
        nextProps.words.forEach((w)=>{
            new WordRegion(document.getElementById('canvas'), w).draw();
        })
    }

    componentDidMount(){
        var img = new window.Image();
        $(img).on("load", () => {
            var c = document.getElementById("canvas");
            c.width = img.width;
            c.height = img.height;
            c.globalCompositeOperation='destination-over';
            c.getContext("2d").drawImage(img,0,0);
        });
        img.src = location.pathname + "/data";
    }

    render(){
        return <canvas id='canvas' />;
    }
}
