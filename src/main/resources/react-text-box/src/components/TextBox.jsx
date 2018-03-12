import React from 'react';
import PropTypes from 'prop-types';
import './TextBox.css';

const DumbTextBox = ({value, handleChange}) => {
    return (
        <input type="text" value={value} className="DumbTextBox" onChange={handleChange}>

        </input>
    );
};

DumbTextBox.propTypes = {
    value: PropTypes.string.isRequired,
    handleChange: PropTypes.func.isRequired
};

export default DumbTextBox;
