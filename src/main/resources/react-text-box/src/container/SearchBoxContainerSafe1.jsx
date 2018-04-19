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

    checkValue(eventValue){ //<2>
        return eventValue === this.state.value;
    }

    thenBuilder(value) { //<3>
        return response => { //<4>
            if (this.checkValue(value)) {
                response.json().then(this.handleCallback)
            }
        }
    }

    handleChange(event) {
        if (event.target.value) {
            suggest(event.target.value)
                .then(this.thenBuilder(event.target.value)); //<5>

            this.setState({value: event.target.value});
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
