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

    //tag::fetch[]
    handleCallback(result){ //<1>
        const suggestions = result.map(suggestion_json => suggestion_json.value);
        this.setState({suggestions: suggestions});
    }

    handleChange(event) { //<2>
        if (event.target.value) { //<3>
            suggest(event.target.value) //<4>
                .then(response => response.json()) //<5>
                .then(this.handleCallback);

            this.setState({value: event.target.value}); //<6>
        } else {
            this.setState({value: "", suggestions: []});
        }

    }
    //end::fetch[]

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
