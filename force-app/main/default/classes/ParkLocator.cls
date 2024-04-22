public class ParkLocator {
    public static String[] country(String parkCountry) {
        ParkService.ParksImplPort park = new ParkService.ParksImplPort();
        return park.byCountry(parkCountry);
    }
}