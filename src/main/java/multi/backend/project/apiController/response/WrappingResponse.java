package multi.backend.project.apiController.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
public class WrappingResponse {
    private Object response;
}
