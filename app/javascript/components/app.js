import React from 'react'
import { Route, Switch } from 'react-router-dom'

const App = () => {
    return (
        <Switch>
            <Route exact path="/" component={Courses}/>
            <Route exact path="courses/:id/" component={Course}/>
        </Switch>
    )
}

export default App;