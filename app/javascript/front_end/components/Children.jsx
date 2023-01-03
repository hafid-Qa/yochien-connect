import React, { useState, useEffect } from "react";
import moment from "moment";
import { filters } from "../mockData/data";

import Child from "./Child";

const Children = (props) => {
  const [filter, setFilter] = useState("all");
  const [children, setChildren] = useState([]);
  const [active, setActive] = useState(0);

  useEffect(() => {
    if (filter === "all") {
      setChildren(props.children);
    } else {
      const newChildren = props.children.filter((child) => {
        return child.trip.status === filter;
      });
      setChildren(newChildren);
    }
  }, [filter]);

  const updateStatus = (newStatus, tripId) => {
    const url = `/api/v1/child_in_trips/${tripId}`;
    const csrfToken = document.querySelector("[name='csrf-token']").content;
    const options = {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": csrfToken,
      },
      body: JSON.stringify({ status: newStatus }),
    };
    fetch(url, options)
      .then((response) => response.json())
      .then((data) => {
        setChildren(data);
      });
  };

  const handleClick = (e, index) => {
    setFilter(e.target.textContent);
    setActive(index);
  };

  const handleChange = (e, child) => {
    const new_status = e.target.value;
    // TODO: update database with API
    updateStatus(new_status, child.trip.id);
    // update virtual DOM (update value of dropdown)
    setChildren((prevChildren) => {
      const newChildren = prevChildren.map((prevChild) => {
        return child.id === prevChild.id
          ? { ...prevChild, status: new_status }
          : prevChild;
      });
      return newChildren;
    });
    console.log(children);
  };

  return (
    <div className="container mt-5">
      <p className="m-0">{moment().format("dddd, MMM Do YYYY")}</p>
      <h3 className="mt-1 mb-3">{moment().format("h:mm a")}</h3>

      <div className="filter-container">
        {filters.map((filter, index) => {
          return (
            <span
              className={`${
                active === index ? "btn-primary" : "btn-secondary"
              } btn btn-small mb-1`}
              key={index}
              onClick={(e) => {
                handleClick(e, index);
              }}
            >
              {filter}
            </span>
          );
        })}
      </div>

      <div className="row gap-2">
        {children.map((child) => {
          return (
            <Child
              key={child.id}
              child={child}
              tripId={child.trip.id}
              handleChange={handleChange}
            />
          );
        })}
      </div>
    </div>
  );
};

export default Children;
