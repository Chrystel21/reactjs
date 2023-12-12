// App.jsx
import React, { useState } from 'react';
import './App.css'; // Import your global styles
import ContactForm from './components/contactForm';
import ContactTable from './components/contactTable';

const App = () => {
  const [contacts, setContacts] = useState([]);
  const [selectedContact, setSelectedContact] = useState(null);

  const addContact = (newContact) => {
    setContacts([...contacts, { ...newContact, id: contacts.length + 1 }]);
  };

  const handleView = (contact) => {
    setSelectedContact(contact);
  };

  const handleUpdate = (updatedContact) => {
    setContacts(contacts.map((contact) => (contact.id === updatedContact.id ? updatedContact : contact)));
    setSelectedContact(null);
  };

  const handleDelete = (contact) => {
    setContacts(contacts.filter((c) => c.id !== contact.id));
    setSelectedContact(null);
  };

  return (
    <div className="container">
      <h1>Contact List Web Application</h1>
      <ContactForm addContact={addContact} />
      <ContactTable contacts={contacts} onView={handleView} onUpdate={handleUpdate} onDelete={handleDelete} />
    </div>
  );
};

export default App;

