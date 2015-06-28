'use strict'

var NavChoice = React.createClass({
   render: function() {
       if (this.props.admin) {
           return (<div><Admin /></div>);
       } else {
           return (<div><Navigation /></div>);
       }
   }
});

var Navigation = React.createClass({
   render: function () {
       return (
           <nav role='Navigation' className='my-cool-nav'>
               <ul className='nav nav-tabs'>
                    <NavLink name='Congo' url='/' />
                    <LogIn />
               </ul>
           </nav>
       )
   }
});

var Admin = React.createClass({
    render: function () {
        return (
            <nav role='Navigation' className='my-cool-nav'>
                <ul className='nav nav-tabs'>
                    <NavLink name='Congo' url='/' />
                    <NavLink name='All Orders' url='/orders' />
                    <LogIn />
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
        window.location.href = this.props.url;
    }
});

var LogIn = React.createClass({
    getInitialState: function() {
       return {
            email: "",
            password: ""
        };

    },

    render: function() {
        return (
            <div id="signin" className="navbar-form navbar-right" role="form">
                <div className="input-group">
                <span className="input-group-addon"><i className="glyphicon glyphicon-user"></i></span>
                    <input onChange={this.emailChange} id="email" type="email" className="form-control" name="email" placeholder="Email Address"/>
                </div>

                <div className="input-group">
                <span className="input-group-addon"><i className="glyphicon glyphicon-lock"></i></span>
                    <input onChange={this.passwordChange} id="password" type="password" className="form-control" name="password" placeholder="Password"/>
                </div>

                <button onClick={this.submit} type="submit" className="btn btn-primary">Login</button>
                <button onClick={this.logout} type="submit" className="btn btn-primary">Logout</button>
            </div>
        )
    },

    submit: function(event) {
        $.post('/login',this.state , function(){
            $.get('/');
            console.log('Hi!!');
        });
    },

    emailChange: function() {
        this.setState({email: event.target.value})
    },
    passwordChange: function() {
        this.setState({password: event.target.value})
    },

    logout: function(event) {
        $.get('/logout', this.state, function(){
            $.get('/');
            console.log('GoodBye');
        });
    },

    emailLogout: function() {
        this.setState({email: ""});
    },

    passwordLogout: function() {
        this.setState({password: ""});
    }
});

