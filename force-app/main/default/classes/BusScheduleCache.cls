public class BusScheduleCache {
    private Cache.OrgPartition part;
    public BusScheduleCache() {
        part = Cache.Org.getPartition('local.BusSchedule');
    }
    public void putSchedule(String busLine, Time[] schedule) {
        part.put(busLine, schedule);
    }
    public Time[] getSchedule(String busLine) {
        Time[] schedule = (Time[]) part.get(busLine);
        if (schedule == null) {
            schedule = new Time[2];
            schedule[0] = Time.newInstance(8, 0, 0, 0);
            schedule[1] = Time.newInstance(17, 0, 0, 0);
        }
        return schedule;
    }
}
