// Course index page
import React, {useState, useEffect, Fragment}from 'react'
import axios from 'axios'

const Courses = () => {

    const [courses, setCourses] = useState([])

    useEffect(()=>{
        //get all courses from API
        //update arlines in our state
        axios.get('/api/v1/courses.json')
        .then(resp => {
            setCourses(resp.data)
        })
        .catch(resp => console.log(resp))
    }, [courses.length])

    const list = courses.map (item =>{
        return (<li key={item.id}>{item.title}</li>)
    })
    return (
        <Fragment>
            <div>
                This is the Courses#index page
            </div>
            <ul>{list}</ul>
        </Fragment>
    )
}

export default Courses;