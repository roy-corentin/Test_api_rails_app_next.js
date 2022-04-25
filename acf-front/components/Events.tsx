import React from "react";
import axios from "axios";
import Event from "./Event";

interface IEvent {
  id: string;
  title: string;
  desc: string;
  date: string;
}

const defaultEvents: IEvent[] = [];

const API_EVENTS_URL = "http://localhost:3000/events";

const Events: React.FC = () => {
  const [events, setEvents]: [IEvent[], (events: IEvent[]) => void] =
    React.useState(defaultEvents);
  const [loading, setLoading]: [boolean, (loading: boolean) => void] =
    React.useState<boolean>(true);
  const [error, setError]: [string, (error: string) => void] =
    React.useState("");

  React.useEffect(() => {
    axios
      .get<IEvent[]>(API_EVENTS_URL)
      .then((response) => {
        setEvents(response.data);
        setLoading(false);
      })
      .catch((ex) => {
        const error =
          ex.response.status == 404
            ? "Ressource Not found"
            : "An unexpected error has occurred";
        setError(error);
        setLoading(false);
      });
  }, []);

  return (
    <div className="text-lg">
      <ul>
        {events.map((event) => (
          <div>
            <Event
              id={event.id}
              title={event.title}
              desc={event.desc}
              date={event.date}
            />
          </div>
        ))}
      </ul>
      {error && <p>{error}</p>}
    </div>
  );
};

export default Events;
