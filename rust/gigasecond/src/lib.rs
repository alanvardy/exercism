use chrono::{DateTime, TimeZone, Utc};

// Returns a Utc DateTime one billion seconds after start.
pub fn after(start: DateTime<Utc>) -> DateTime<Utc> {
    let num: i64 = start.timestamp() + 1000000000;
    Utc.timestamp(num, 0)
}
