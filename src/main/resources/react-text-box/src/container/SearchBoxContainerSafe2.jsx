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


    checkValue(eventValue){
        return eventValue === this.state.value;
    }

    handleCallback = (value) => (response) => {
        if (this.checkValue(value)) {
            response.json().then( (result) =>
                this.setState(
                    {suggestions: result.map(suggestion_json => suggestion_json.value)}
                )
            )
        }
    };

    handleChange(event) {
        if (event.target.value) {
            suggest(event.target.value)
                .then(this.handleCallback(event.target.value));

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
