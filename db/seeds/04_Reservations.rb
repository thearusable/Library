#reservations - ready
Reservation.delete_all
Reservation.create(received: true, returned: false, reader_id: 1);
Reservation.create(received: false, returned: false, reader_id: 1);
Reservation.create(received: false, returned: false, reader_id: 1);
Reservation.create(received: true, returned: true, reader_id: 1);
Reservation.create(received: true, returned: true, reader_id: 1);
Reservation.create(received: false, returned: false, reader_id: 2);
Reservation.create(received: true, returned: false, reader_id: 3);