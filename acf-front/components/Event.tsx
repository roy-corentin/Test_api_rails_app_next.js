import React from "react";

interface IEvent {
  id: string;
  title: string;
  desc: string;
  date: string;
}

const Event: React.FC<IEvent> = ({ id, title, desc, date }) => (
  <div key="{id}">
    <h3>{title}</h3>
    <p>{desc}</p>
    <p>{date}</p>
  </div>
);

export default Event;
