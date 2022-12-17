import React, { useState, useEffect } from "react";
import moment from "moment";
import { childrenData, statuses } from "../mockData/data";

import Child from "./Child";

const Children = () => {
  const [filter, setFilter] = useState("all");
  const [children, setChildren] = useState([]);
  const [active, setActive] = useState(0);

  useEffect(() => {
    if (filter === "all") {
      setChildren(childrenData);
    } else {
      const newChildren = childrenData.filter((child) => {
        return child.currentStatus === filter;
      });
      setChildren(newChildren);
    }
  }, [filter]);

  const handleClick = (e, index) => {
    setFilter(e.target.textContent);
    setActive(index);
  };

const Children = (props) => {
  const { children } = props;
  return (
    <div className="container mt-5">
      <p className="m-0">{moment().format("dddd, MMM Do YYYY")}</p>
      <h3 className="mt-1 mb-3">{moment().format("h:mm a")}</h3>

      <div className="mt-3 mb-2">
        {statuses.map((status, index) => {
          return (
            <span
              className={`${
                active === index ? "btn-primary" : "btn-secondary"
              } btn btn-small me-2 mb-1`}
              key={index}
              onClick={(e) => {
                handleClick(e, index);
              }}
            >
              {status}
            </span>
          );
        })}
      </div>

      <div className="row gap-2">
        {children.map((child) => {
          return (
            <Child
              key={child.id}
              name={child.full_name}
              age={child.age}
              currentStatus={child.status}
              address={child.full_address}
            />
          );
        })}
      </div>
    </div>
  );
};

export default Children;
