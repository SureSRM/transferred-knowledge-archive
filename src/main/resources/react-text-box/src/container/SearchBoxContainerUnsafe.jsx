import React, {Component} from 'react';
import PropTypes from 'prop-types';

import TextBox from "../components/TextBox";
import SuggestionsBox from "../components/SuggestionsBox";
import {suggest} from "../api";

class SearchBoxContainer extends Component {

    constructor(props) {
        super(props);
        this.state = {
            value: '',
            suggestions: [],
        };

        this.handleChange = this.handleChange.bind(this);
        this.handleCallback = this.handleCallback.bind(this);
    }

    handleCallback(result){
        const suggestions = result.map(suggestion_json => suggestion_json.value);
        this.setState({suggestions: suggestions});
    }

    handleChange(event) {
        if (event.target.value) {
            suggest(event.target.value)
                .then(response => response.json())
                .then(this.handleCallback);

            this.setState({value: event.target.value});
        } else {
            this.setState({value: "", suggestions: []});
        }

    }

    render() {
        return (
            <div>
                <TextBox value={this.state.value} handleChange={this.handleChange}/>
                <SuggestionsBox content={this.state.suggestions}/>
            </div>
        );
    }
}

SearchBoxContainer.propTypes = {
};

export default SearchBoxContainer;
