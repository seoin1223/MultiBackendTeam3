package multi.backend.project.service;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@Slf4j
@SpringBootTest
class TourInfoServiceTest {

    @Autowired private TourInfoService tourInfoService;

    @Test
    void getTourInfoURI() {
        log.info("{}", tourInfoService.getTourInfoURI());
    }
}