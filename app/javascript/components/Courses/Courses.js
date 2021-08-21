// Course index page
import React, {useState, useEffect}from 'react'
import axios from 'axios'
import Course from './Course'

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
        return (
            <Course 
                title={item.title}
                summary={item.summary}
                category={item.category}
            />
        )
    })
    return (
        <section className="all-courses">
            <header>
                This is the Courses#index page
            </header>
            <ul>{list}</ul>
        </section>
    )
}

export default Courses;