'use strict'

var Cart = React.createClass({
    getInitialState: function() {
        return {
            userName: this.props.name,
            orderNum: this.props.orderId,
            allItems: []
        };
    },


   render: function () {
       return (
           <div className="side-cart">
               <p> Shopping Cart</p>
               <p>Hello {this.state.userName}</p>
               <p>Order #{this.state.orderNum}</p>
               <ul>
               <itemName allItems={this.state.allItems} />
               </ul>
           </div>
       )
   }
});

var itemName = React.createClass ({
    render: function () {
        return(<li>Items {this.state.allItems}</li>);
    }
});