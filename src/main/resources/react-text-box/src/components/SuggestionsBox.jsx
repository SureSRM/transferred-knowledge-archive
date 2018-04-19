import React from 'react';
import PropTypes from 'prop-types';
import './SuggestionsBox.css';

const SuggestionsBox = ({content}) => {
    return (
        <ul className="SuggestionsBox">
            {content.map((suggestion) => <li key={suggestion}>{suggestion}</li>)}
        </ul>
    );
};

SuggestionsBox.propTypes = {
    content: PropTypes.arrayOf(PropTypes.string).isRequired
};

export default SuggestionsBox;
