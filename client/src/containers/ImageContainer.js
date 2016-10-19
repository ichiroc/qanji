import {connect} from 'react-redux';
import Image from '../components/Image.jsx';

const mapStateToProps = (state) => {
    return {
        words: state.words
    };
};

const ImageContainer = connect(mapStateToProps)(Image);
export default ImageContainer;
