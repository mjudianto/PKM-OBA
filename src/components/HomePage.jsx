import React, { Component } from 'react';
import axios from 'axios';

class HomePage extends Component {
  constructor(props) {
    super(props);

    this.state = {
      username: '',
    };
  }
  handleInputChange = e => {
    this.setState({
      [e.target.name]: e.target.value,
    });
  };

  handleSubmit = e => {
    e.preventDefault();

    const { username } = this.state;

    const user = {
      username
    };

    // console.log(user)

    axios.post('../../post', user)
      .then(() => console.log('User Created'))
      .catch(err => {
        console.error(err);
      });
  };

  render() { 
    const labelStyle = {
      margin: '10px',
    }

    return (
      <React.Fragment>
        <h1 style={{margin: "10px"}}>HomePage</h1>
        <form action="../../post" method="post" className="form" onSubmit={this.handleSubmit}>
          <label htmlFor="" style={labelStyle}>Username : </label>
          <input type="text" name="username" className='m-3' onChange={this.handleInputChange}/>
          <button type="submit" className='btn btn-primary'>Submit</button>
        </form>
      </React.Fragment>    
    );
  }
}
 
export default HomePage;