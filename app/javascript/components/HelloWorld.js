import React from "react"
import PropTypes from "prop-types"
class SearchBar extends React.Component {
  render () {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
      </React.Fragment>
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.node
};
export default SearchBar
