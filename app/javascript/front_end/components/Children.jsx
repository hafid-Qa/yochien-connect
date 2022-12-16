import React from "react";
import Box from "@mui/material/Box";
import moment from "moment";
import { DataGrid, GridToolbar } from "@mui/x-data-grid";

import Child from "./Child";

const columns = [
  { field: "id", headerName: "ID", width: 70 },
  { field: "firstName", headerName: "First name", width: 130 },
  { field: "lastName", headerName: "Last name", width: 130 },
  { field: "age", headerName: "Age", type: "number", width: 90 },
];

const childrenData = [
  {
    id: 1,
    lastName: "Snow",
    firstName: "Jooooon",
    age: 35,
    currentStatus: "status 1",
  },
  {
    id: 2,
    lastName: "Lannister",
    firstName: "Cersei",
    age: 42,
    currentStatus: "status 2",
  },
  {
    id: 3,
    lastName: "Lannister",
    firstName: "Jaime",
    age: 45,
    currentStatus: "status 3",
  },
  {
    id: 4,
    lastName: "Stark",
    firstName: "Aryaaa",
    age: 16,
    currentStatus: "status 1",
  },
  {
    id: 5,
    lastName: "Targaryen",
    firstName: "Daenerys",
    age: null,
    currentStatus: "status 2",
  },
  {
    id: 6,
    lastName: "Melisandre",
    firstName: null,
    age: 150,
    currentStatus: "status 3",
  },
  {
    id: 7,
    lastName: "Clifford",
    firstName: "Ferrara",
    age: 44,
    currentStatus: "status 1",
  },
  {
    id: 8,
    lastName: "Frances",
    firstName: "Rossini",
    age: 36,
    currentStatus: "status 1",
  },
  {
    id: 9,
    lastName: "Roxie",
    firstName: "Harvey",
    age: 65,
    currentStatus: "status 2",
  },
];

const Children = (props) => {
  const { children } = props;
  console.log(children);
  return (
    <div className="container mt-5">
      <p className="m-0">{moment().format("dddd, MMM Do YYYY")}</p>
      <h3 className="mt-1 mb-3">{moment().format("h:mm a")}</h3>

      <div className="row gap-2">
        {children.map((child) => {
          return (
            <Child
              key={child.id}
              name={child.full_name}
              age={10}
              currentStatus={child.status}
              address={child.full_address}
            />
          );
        })}
      </div>

      {/* <Box sx={{ height: 400, width: "100%" }}>
        <DataGrid
          rows={rows}
          columns={columns}
          pageSize={5}
          rowsPerPageOptions={[5]}
          // checkboxSelection
          // components={{ Toolbar: GridToolbar }}
        />
      </Box> */}
    </div>
  );
};

export default Children;
