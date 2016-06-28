package Blog.Util;

/**
 * Created by sl on 16-4-8.
 */
public class StatusMessage {

    private int status;
    private String message;

    public StatusMessage(int status , String message){
        super();
        this.status = status;
        this.message = message;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
