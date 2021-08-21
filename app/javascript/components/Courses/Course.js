import React from 'react'

const Course = (props) => {
    return(
        <section>
            <p>Title: {props.title}</p>
            <p>Title: {props.summary}</p>
            <p>Title: {props.category}</p>
        </section>
    )
}

export default Course;