import React from 'react'
import { Route, Switch } from 'react-router-dom'
import Courses from './Courses/Courses'
import Course from './Course/Course'

const App = () => {
    return (
        <Switch>
            <Route exact path="/courses" component={Courses}/>
            <Route exact path="courses/:id/" component={Course}/>
        </Switch>
    )
}

export default App;