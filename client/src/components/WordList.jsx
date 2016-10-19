import React from 'react';
import Word from './Word.jsx';
import WordRegion from './WordRegion.jsx';
import $ from 'jquery';

export default class WordList extends React.Component{
    constructor(props){
        super(props);
        this.state = { data: { words: [] } };
    }

    render (){
        if(this.props.words.length == 0 ) { return <div /> ;}
        var wordNodes = this.props.words.map((w) => {
            return <Word key={w.id} text={w.text} english={w.english} category={w.category} score={w.score} />;
        });

        return(
            <table className='table'>
              <thead>
                <tr>
                  <th>Word</th>
                  <th>English</th>
                  <th>Category</th>
                  <th>Score</th>
                </tr>
              </thead>
              <tbody>
                {wordNodes}
              </tbody>
            </table>
        );
    }
}
