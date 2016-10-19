import { connect } from 'react-redux';
import Status from '../components/Status.jsx';

const mapStateToProps = (state) =>{
    return {
        status: state.status
    };
};

const StatusContainer = connect(mapStateToProps)(Status);

export default StatusContainer;
