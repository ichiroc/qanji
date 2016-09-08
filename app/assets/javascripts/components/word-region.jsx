class WordRegion {
    constructor(canvas, word){
        this.ctx = canvas.getContext('2d');
        this.word = word;
    }

    draw(){
        var min = this.minCoordinate(this.word.coordinates);
        var x = min.x;
        var y = min.y;
        var width = this.width(this.word.coordinates);
        var height = this.height(this.word.coordinates);
        this.ctx.strokeStyle = "red";
        this.ctx.beginPath();
        this.ctx.rect(x, y, width, height);
        this.ctx.stroke();
    }

    coordinates(){
        return this.word
            .coordinates
            .map( function(c){
                return [c.x, c.y] ;
            });
    }

    minCoordinate(coordinates){
        // 一番xとyが小さい座標を取得
        var minX = coordinates[0].x;
        var minY = coordinates[0].y;
        coordinates.forEach( (c)=>{
            if(c.x < minX && c.y < minY){
                minX = c.x;
                minY = c.y;
            }
        });
        return { x: minX, y: minY };
    }

    maxCoordinate(coordinates){
        // 一番xとyが小さい座標を取得
        var maxX = coordinates[0].x;
        var maxY = coordinates[0].y;
        coordinates.forEach( (c)=>{
            if(maxX < c.x && maxY < c.y ){
                maxX = c.x;
                maxY = c.y;
            }
        });
        return { x: maxX, y: maxY };
    }

    width(coordinates){
        // 一番小さい x と大きい x の差を返す
        return this.maxCoordinate(coordinates).x - this.minCoordinate(coordinates).x;
    }

    height(coordinates){
        // 一番小さい y と大きい y の差を返す
        return this.maxCoordinate(coordinates).y - this.minCoordinate(coordinates).y;
    }
}
