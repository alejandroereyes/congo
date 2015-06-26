'use strict'

var Navigation = React.createClass({
   render: function () {
       return (
           <nav role='Navigation'>
               <ul className='nav nav-tabs'>
                    <NavLink name='Home'url='/' />
               </ul>
           </nav>
       )
   }
});

var NavLink = React.createClass({
    render: function() {
        return (<li><a onClick={this.clicked}>{this.props.name}</a></li>)
    },

    clicked: function() {
        window.locaiton.href = this.props.url;
    }
});