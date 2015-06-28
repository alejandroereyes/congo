'use strict'

var Cart = React.createClass({
    getInitialState: function() {
        return {
            why: ""
        }
    },


   render: function () {
       return (
           <div>
            <p>Hello {this.props.name}</p>
           </div>
       )
   }
});