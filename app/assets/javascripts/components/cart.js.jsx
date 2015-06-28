'use strict'

var Cart = React.createClass({
    getInitialState: function() {
        return {
            userName: this.props.name,
            orderNum: this.props.orderId,
            allItems: this.props.items
        };
    },


   render: function () {
       return (
           <div className="side-cart">
               <p> Shopping Cart</p>
               <p>Hello {this.state.userName}</p>
               <p>Order #{this.state.orderNum}</p>
               <p>Items {this.state.allItems}</p>
           </div>
       )
   },



});