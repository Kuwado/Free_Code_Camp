import React from 'react';

class ControlledInput extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      input: ''
    };
    // Bind handleChange method to the component instance
    this.handleChange = this.handleChange.bind(this);
  }

  // Method to handle input change
  handleChange(event) {
    // Update the state with the input value from the event
    this.setState({
      input: event.target.value
    });
  }

  render() {
    return (
      <div>
        {/* Input field with onChange event handler */}
        <input
          id="text-input"
          type="text"
          value={this.state.input} // Ensure input value is controlled by state
          onChange={this.handleChange} // Call handleChange method on input change
        />
        <h4>Controlled Input:</h4>
        <p>{this.state.input}</p>
      </div>
    );
  }
}

export default ControlledInput;
