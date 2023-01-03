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

  const handleClick = (e, index) => {
    setFilter(e.target.textContent);
    setActive(index);
  };

  const handleChange = (e, child) => {
    const new_status = e.target.value;
    console.log(new_status);

    // TODO: update database with API
    console.log("updating database...");
    console.log("updated");

    // TODO: update virtual DOM (update value of dropdown)
    // setChildren((prevChildren) => {
    //   prevChildren.map((prev_child) => {
    //     return child.id === prev_child.id
    //       ? {
    //           ...prev_child,
    //           status: new_status,
    //         }
    //       : prev_child;
    //   });
    // });
    // console.log(children);
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
            <Child key={child.id} child={child} tripId={child.trip.id} handleChange={handleChange} />
          );
        })}
      </div>
    </div>
  );
};

export default Children;
